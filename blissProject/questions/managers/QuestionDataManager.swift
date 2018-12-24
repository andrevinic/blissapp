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
    
    func fetchQuestions(completion: @escaping (_ success: Bool, _ error: Error?) -> Void){
        
        NetworkManager.shared.fetchQuestions(limit: limit, offset: offset)  { (questions, error) in
            self.questions.append(contentsOf: questions)
            completion(true, nil)
            self.offset += self.limit
        }
    }
    
    @objc class func sharedInstance() -> QuestionDataManager{
        return QuestionDataManager.shared;
    }
    
    @objc func fetchVote(_ index: Int){
        let question = self.questions[index]
        NetworkManager.shared.vote(question_id: question.id)
    }
}

