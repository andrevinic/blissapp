//
//  Status.swift
//  blissProject
//
//  Created by André Nogueira on 12/18/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation

struct Status{
    let status: String
}

extension Status:Decodable{
    
    private enum ResultCodingKeys: String, CodingKey{
        case status
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResultCodingKeys.self)
        status = try container.decode(String.self, forKey: .status)
    }
}
