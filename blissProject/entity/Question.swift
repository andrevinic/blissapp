//
//  Question.swift
//  blissProject
//
//  Created by André Nogueira on 12/16/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation

struct Question{
    
    let id: Int
    let question: String
    let image_url: String
    let thumb_url: String
    let published_at: String
}

extension Question: Decodable{
    
    private enum ResultCodingKeys: String, CodingKey{
        case id
        case question
        case image_url
        case thumb_url
        case published_at
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        question = try container.decode(String.self, forKey: .question)
        image_url = try container.decode(String.self, forKey: .image_url)
        thumb_url = try container.decode(String.self, forKey: .thumb_url)
        published_at = try container.decode(String.self, forKey: .published_at)
    }
}


