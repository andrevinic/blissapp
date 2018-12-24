//
//  UpcomingService.swift
//  
//
//  Created by André Nogueira on 12/14/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation
import Moya

enum QuestionService{
    
    case questions(limit: Int, offset: Int)
    case question(question_id: Int)
    case health
    case vote(question_id: Int)
}

extension QuestionService:TargetType{
    
    var headers: [String : String]? {
        switch self{
        case .question:
            let parameters = [String: String]()
            return parameters
        case .questions:
            let parameters = [String: String]()
            return parameters
        case .health:
            let parameters = [String: String]()
            return parameters
        case .vote:
            let parameters = [String : String]()
            return parameters
        }

    }
    
    var environmentBaseURL: String{
        return "https://private-bbbe9-blissrecruitmentapi.apiary-mock.com"
    }
        
    var baseURL: URL {
        
        return URL(string: environmentBaseURL)!}
    
    var path: String{
        
        switch self{
            
        case .question(let question_id):
            return "/questions/\(question_id)"
        case .questions:
            return "/questions"
        case .health:
            return "/health"
        
        case .vote(let question_id):
            return "/questions/\(question_id)"
        }
        
    }
    
    var method: Moya.Method{
        
        switch self {
        case .question:
            return .get
        case .questions:
            return .get
        case .health:
            return .get
        case .vote:
            return .put
        }
    }
    
    var parameters: [String: Any]? {
        switch self{
        case .question:
            let parameters = [String: Any]()
            return parameters
        case .questions(let limit, let offset):
            var parameters = [String: Any]()
            parameters["limit"] = limit
            parameters["offset"] = offset
            return parameters
        case .health:
            let parameters = [String: Any]()
            return parameters
        case .vote:
            let parameters = [String: Any]()
            return parameters
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        guard let parameters = self.parameters else{
            return .requestPlain
        }
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
}
