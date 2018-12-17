//
//  LoadScreenViewController.swift
//  blissProject
//
//  Created by André Nogueira on 12/16/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit

class LoadScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHealth()
    }

    func fetchHealth(){
        NetworkManager.shared.fetchHealth { (success, error) in
            switch success{
            case true:
                self.buildQuestionsViewController()
                print("STATUS OK")
            case false:
                print("STATUS NOT OK")
            }
        }
    }
    
    func buildQuestionsViewController(){
        guard let questionsViewController = R.storyboard.questions.questionsViewController()
            else{
                return
        }
        self.navigationController?.pushViewController(questionsViewController, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func retryConnection(_ sender: Any) {
        self.fetchHealth()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
