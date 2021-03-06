//
//  QuestionDataManager.swift
//  blissProject
//
//  Created by André Nogueira on 12/24/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit

class QuestionDataManager: NSObject {
    
    public static let shared:QuestionDataManager = QuestionDataManager()
    
    public var questions: [Question] = []
    var limit = 10
    var offset = 0
    
    func questionsLength()->Int{
        return questions.count
    }
    
    func fetchQuestion(id: Int, completion: @escaping (_ question: Question, _ error: Error?) -> Void){
        NetworkManager.shared.fetchQuestion(id: id) { (question, error) in
            completion(question, nil)
        }
    }
    
    func fetchQuestions(completion: @escaping (_ success: Bool, _ error: Error?) -> Void){
  
        NetworkManager.shared.fetchQuestions(limit: limit, offset: offset, filter: "")  { (questions, error) in
            self.questions.append(contentsOf: questions)
            completion(true, nil)
            self.offset += self.limit
        }
    }
    
    func fetchQuestions(filter_query: String?, completion: @escaping (_ filteredQuestions: [Question], _ error: Error?) -> Void){
        
        NetworkManager.shared.fetchQuestions(limit: limit, offset: offset, filter: filter_query ?? "")  { (questions, error) in
            completion(questions, nil)
        }
    }
    
    @objc class func sharedInstance() -> QuestionDataManager{
        return QuestionDataManager.shared;
    }
    
    @objc func fetchVote(_ index: Int){
        let question = self.questions[index]
        NetworkManager.shared.vote(question_id: question.id)
    }
    
    @objc func fetchShare(destination_email: String, content_url: String?, completion: @escaping (_ success: Bool, _ error: Error?) -> Void){
        
        NetworkManager.shared.share(destination_url: destination_email, content_url: content_url) { (success, error) in
            if success{
                completion(true, nil)
            }
            completion(false, nil)
        }
        
    }
}
