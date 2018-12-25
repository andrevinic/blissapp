//
//  QuestionsViewModel.swift
//  blissProject
//
//  Created by André Nogueira on 12/17/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit

class QuestionsViewModel: NSObject {

    let questionDataManager = QuestionDataManager.shared
    
    func fetchQuestion(id: Int, completion: @escaping (_ question: Question, _ error: Error?) -> Void){
        questionDataManager.fetchQuestion(id: id) { (question, error) in
            completion(question, error)
        }
    }
    func fetchQuestions(completion: @escaping (_ success: Bool, _ error: Error?) -> Void){
        
        questionDataManager.fetchQuestions { (success, error) in
            completion(success, error)
        }
    }
    
    func fetchQuestions(filter_query: String, completion: @escaping (_ filteredQuestions: [Question], _ error: Error?) -> Void){
        
        questionDataManager.fetchQuestions(filter_query: filter_query) { (filteredQuestions, error) in
            completion(filteredQuestions, error)
        }
    }
    
    func questionsLength()->Int{
        return self.questionDataManager.questionsLength()
    }
}
