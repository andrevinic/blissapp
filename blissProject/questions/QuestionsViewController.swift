//
//  QuestionsViewController.swift
//  blissProject
//
//  Created by André Nogueira on 12/17/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit
import Reachability
import SwiftMessages

class QuestionsViewController: UIViewController {
    
    let questionsViewModel = QuestionsViewModel()
    let searchController = UISearchController(searchResultsController: nil)
    var filteredQuestions = [Question]()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:false);

        tableView.register(R.nib.questionTableViewCell)
        
        fetchQuestions()
        setupSearchFilter()
      
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated:false);

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false;
        self.navigationItem.setHidesBackButton(true, animated:true);
        ReachabilityManager.shared.addListener(listener: self)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        ReachabilityManager.shared.removeListener(listener: self)

    }
    
    func fetchQuestions(){
        questionsViewModel.fetchQuestions{ (success, error) in
            self.tableView.reloadData()

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupSearchFilter(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Questions"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {

        self.questionsViewModel.fetchQuestions(filter_query: searchText.lowercased()) { (filteredQuestions, error) in
            self.filteredQuestions = filteredQuestions
            self.tableView.reloadData()
        }
    }
}

extension QuestionsViewController: UITableViewDataSource{
    //MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredQuestions.count
        }
        return questionsViewModel.questionDataManager.questionsLength()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.questionTableViewCell.identifier, for: indexPath)
        let question: Question
        
        if isFiltering() {
            question = filteredQuestions[indexPath.row]
        }else{
            question = questionsViewModel.questionDataManager.questions[indexPath.row]
        }
        
        if let cellQuestion = cell as? QuestionTableViewCell {
            configureCell(question: question, cell: cellQuestion, forRowAt: indexPath)
        }
        
        return cell
    }
    
    func configureCell(question: Question, cell: QuestionTableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
        cell.configureCell(imageQuestion: question.thumb_url, questionField: question.question)
    }
}

extension QuestionsViewController: UITableViewDelegate{
    
    func didSelectConfig(question: Question, detailsResultViewController: DetailsResultViewController){
        
        self.questionsViewModel.fetchQuestion(id: question.id) { (question, error) in
            if(error == nil){
                let choices = question.choices
                
                var array1: [String] = []
                var array2: [NSNumber] = []
                for choice in choices{
                    array1.append(choice.choice)
                    array2.append(NSNumber(value: choice.votes))
                }
                
                detailsResultViewController.choices_description = array1
                detailsResultViewController.choices_values = array2
                detailsResultViewController.image_question_url = question.image_url
                detailsResultViewController.question_overview = question.question
                self.navigationController?.pushViewController(detailsResultViewController, animated: true)
            }else{
                fatalError("Couldn't fetch this question")
            }
        }
        
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let detailquestionVC = R.storyboard.details.detailsResultViewController()
            else{return}
        
        let question = questionsViewModel.questionDataManager.questions[indexPath.row]
        self.didSelectConfig(question: question, detailsResultViewController: detailquestionVC)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if isFiltering(){return}
        
        let index = indexPath.row
        
        if index == self.questionsViewModel.questionDataManager.questions.count - 1 {
            fetchQuestions()
        }
    }
}

extension QuestionsViewController: NetworkStatusListener {
    
    func networkStatusDidChange(status: Reachability.Connection) {
        
        switch status {
        case .none:
            SwiftMessageManager.shared.showMessageNoInternet()
        case .wifi:
            SwiftMessageManager.shared.hideMessageInternet()
        case .cellular:
            SwiftMessageManager.shared.hideMessageInternet()

        }

    }
    
}

extension QuestionsViewController:UISearchResultsUpdating{
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
