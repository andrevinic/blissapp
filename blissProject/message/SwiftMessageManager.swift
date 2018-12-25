//
//  SwiftMessageManager.swift
//  blissProject
//
//  Created by André Nogueira on 12/24/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit
import SwiftMessages

class SwiftMessageManager: NSObject {
    
    static let shared:SwiftMessageManager = SwiftMessageManager()
    
    func showMessageNoInternet(){

        let view = MessageView.viewFromNib(layout: .statusLine)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.configureContent(body: "There is no internet connection.")
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 10

        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.duration = .forever
        config.dimMode = .gray(interactive: false)
        config.preferredStatusBarStyle = .lightContent
        SwiftMessages.show(config: config, view: view)
    }
    
    func hideMessageInternet(){
        SwiftMessages.hide()
    }
}
