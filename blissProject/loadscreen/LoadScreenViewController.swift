//
//  LoadScreenViewController.swift
//  blissProject
//
//  Created by André Nogueira on 12/16/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit
import Lottie
import SnapKit

class LoadScreenViewController: UIViewController {
    let animationView = LOTAnimationView(name: "download_icon_success")
    let animationView_withoutInternet = LOTAnimationView(name: "no_internet_connection")
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var retryConnectionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupConnectingAnimation()
        self.setupNoConnectionAnimation()
        self.handleConnectingAnimation()
       
    }
    
    func fetchHealth(){
        
        NetworkManager.shared.fetchHealth { (success, error) in
            switch success{
            case true:
                self.buildQuestionsViewController()
            case false:
                self.handleNoInternet()
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
        self.handleConnectingAnimation()
    }
}

extension LoadScreenViewController:LoadScreenAnimation{
    func setupConnectingAnimation(){
        animationView.contentMode = .scaleAspectFill
        self.view.addSubview(animationView)
        self.animationView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.view.snp.centerY)
            make.centerX.equalTo(self.view.snp.centerX)
        }
    }
    func handleConnectingAnimation(){
        self.animationView.isHidden = false
        self.animationView_withoutInternet.isHidden = true
        retryConnectionButton.isHidden = true
        
        animationView.animationSpeed = 2.0
        
        animationView.play{ (finished) in
            
            self.fetchHealth()
        }
    }
    
    func setupNoConnectionAnimation(){
        animationView_withoutInternet.contentMode = .scaleAspectFill
        self.view.addSubview(animationView_withoutInternet)
        animationView_withoutInternet.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.view.snp.centerY)
            make.centerX.equalTo(self.view.snp.centerX)
        }
    }
    
    func handleNoInternet(){
        self.animationView.stop()
        self.animationView.isHidden = true
        self.animationView_withoutInternet.isHidden = false
        self.retryConnectionButton.isHidden = false
        
        self.retryConnectionButton.snp.makeConstraints { (make) in
            make.top.equalTo(animationView_withoutInternet.snp.top).offset(-30)
            make.centerX.equalTo(self.view.snp.centerX)
            
        }
        
        animationView_withoutInternet.animationSpeed = 2.0
        animationView_withoutInternet.play{ (finished) in
            
        }
    }
}
