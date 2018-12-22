//
//  QuestionsViewController.swift
//  blissProject
//
//  Created by André Nogueira on 12/17/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    let viewModel = QuestionsViewModel()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(R.nib.questionTableViewCell)
        fetch()
    }
    
    func fetch(){
        self.viewModel.fetchQuestions { (success, error) in
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension QuestionsViewController: UITableViewDataSource{
    //MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.questionTableViewCell.identifier, for: indexPath) as! QuestionTableViewCell
        configureCell(cell: cell, forRowAt: indexPath)
        return cell
    }
    
    func configureCell(cell: QuestionTableViewCell, forRowAt indexPath: IndexPath) {
        let question = viewModel.questions[indexPath.row]
        
        cell.configureCell(imageQuestion: question.image_url, questionField: question.question)
    }
}

extension QuestionsViewController: UITableViewDelegate{
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let detailquestionVC = R.storyboard.details.detailsResultViewController()
            else{return}
       
       let question = self.viewModel.questions[indexPath.row]
        let choices = question.choices
//        detailquestionVC.choices = choices
        
        var array1: [String] = []
        var array2: [NSNumber] = []
        for choice in choices{
            array1.append(choice.choice)
            array2.append(NSNumber(value: choice.votes))
        }
        
        detailquestionVC.choices_description = array1
        detailquestionVC.choices_values = array2
        detailquestionVC.image_question_url = question.image_url
        detailquestionVC.question_overview = question.question
        self.navigationController?.pushViewController(detailquestionVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        if index == self.viewModel.questions.count - 1 {
            fetch()
        }
    }
}
