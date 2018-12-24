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
    
    func fetchQuestions(completion: @escaping (_ success: Bool, _ error: Error?) -> Void){
        
        questionDataManager.fetchQuestions { (success, error) in
            completion(success, error)
        }
    }
    
    func questionsLength()->Int{
        return self.questionDataManager.questionsLength()
    }
}
