//
//  ChoiceList.swift
//  blissProject
//
//  Created by André Nogueira on 12/16/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation

struct ChoiceList{
    var choices:[Choice] = []
}


extension ChoiceList: Decodable{
    
    private enum ResultCodingKeys: String, CodingKey{
        case choices
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        choices = try container.decode([Choice].self, forKey: .choices)
    }
}

struct Choice{
    var choice: String
    var votes: Int
}

extension Choice: Decodable{
    
    private enum ResultCodingKeys: String, CodingKey{
        case choice
        case votes
        case image_url
        case thumb_url
        case published_at
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        choice = try container.decode(String.self, forKey: .choice)
        votes = try container.decode(Int.self, forKey: .votes)
    }
}

