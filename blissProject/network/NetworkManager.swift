//
//  NetworkManager.swift
//  
//
//  Created by André Nogueira on 12/14/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation
import Moya
import RxCocoa
import RxSwift

protocol Networkable{
    var provider: MoyaProvider<QuestionService> { get }
}

struct NetworkManager: Networkable{
    
    var provider = MoyaProvider<QuestionService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    static let shared:NetworkManager = NetworkManager()

    func fetchHealth(completion: @escaping (_ success: Bool, _ error: Error?) -> Void){
        
        provider.request(.health) { result in
            switch result {
            case let .success(moyaResponse):
                completion(true, nil)
            case let .failure(error):
                completion(false, error)
                
            }
        }
    }
    
    func fetchQuestions(completion: @escaping (_ success: [Question], _ error: Error?) -> Void){
    
        provider.rx
        .request(.questions)
        .subscribe(onSuccess: { (response) in

            if let results = try? response.map([Question].self, atKeyPath: nil, using: JSONDecoder(), failsOnEmptyData: true){

                completion(results, nil)
            }

        }) { (error) in
            debugPrint(error)
        }
    }
}
