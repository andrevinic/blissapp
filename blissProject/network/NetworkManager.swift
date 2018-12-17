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
//
//    func fetchMovieList(page: Int, completion: @escaping (_ success: [Movie], _ error: Error?) -> Void) {
//        let provider = MoyaProvider<MovieService>(plugins: [NetworkLoggerPlugin(verbose: true)])
//        provider.rx
//            .request(.upcoming(pagination: page))
//            .subscribe(onSuccess: { (response) in
//                if let results = try? response.map(Upcoming.self, atKeyPath: nil, using: JSONDecoder(), failsOnEmptyData: true){
//                    completion(results.movies, nil)
//                }
//        }) { (error) in
//            debugPrint(error)
//        }
//    }
}
