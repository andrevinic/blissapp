//
//  Question.swift
//  blissProject
//
//  Created by André Nogueira on 12/16/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation

struct Question: Codable{
    
    var id: Int
    let question: String
    let image_url: String
    let thumb_url: String
    let published_at: String
    var choices: [Choice] = []
    
}

