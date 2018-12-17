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
    
    case questions
    case genrer
}

extension QuestionService:TargetType{
    
    var headers: [String : String]? {
        switch self{
        case .questions:
            let parameters = [String: String]()
            return parameters
        case .genrer:
            let parameters = [String: String]()
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
        case .questions:
            return "/questions"
        case .genrer:
            return "/genre/movie/list"

        }
        
    }
    
    var method: Moya.Method{
        
        switch self {
        case .questions:
            return .get
        case .genrer:
            return .get

        }
    }
    
    var parameters: [String: Any]? {
        switch self{
            
        case .questions:
            var parameters = [String: Any]()
            parameters["limit"] = "30"
            return parameters
        case .genrer:
            var parameters = [String: Any]()
            parameters["api_key"] = "1f54bd990f1cdfb230adb312546d765d"
            parameters["language"] = "en-US"
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
