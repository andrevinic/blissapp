//
//  LoadScreen.swift
//  blissProject
//
//  Created by André Nogueira on 12/24/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation

protocol LoadScreenAnimation {
    func handleNoInternet()
    func handleConnectingAnimation()
    func setupNoConnectionAnimation()
    func setupConnectingAnimation()
}
