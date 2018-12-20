//
//  LoadScreenViewController.swift
//  blissProject
//
//  Created by André Nogueira on 12/16/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit
import Lottie

class LoadScreenViewController: UIViewController {
    let animationView = LOTAnimationView(name: "download_icon_success")
    @IBOutlet weak var loadingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let size = CGSize(width: 40.0, height: 28.0)
//
//        self.animationView.sizeThatFits(size)
//        animationView.contentMode = .scaleAspectFill
//        animationView.frame = CGRect(x: 100, y: 150, width: 200, height: 200)
//        animationView.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
//        animationView.addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0))

//        self.animationView.layoutSubviews()
//        self.animationView.layoutIfNeeded()
//        self.view.addSubview(animationView)
       

        fetchHealth()
    }

    func fetchHealth(){
//        animationView.play(fromProgress: 0, toProgress: 0.5, withCompletion: nil)
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
