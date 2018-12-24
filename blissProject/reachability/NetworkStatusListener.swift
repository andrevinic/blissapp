//
//  NetworkStatusListener.swift
//  blissProject
//
//  Created by André Nogueira on 12/23/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation
import Reachability

public protocol NetworkStatusListener : class {
    func networkStatusDidChange(status: Reachability.Connection)
}
