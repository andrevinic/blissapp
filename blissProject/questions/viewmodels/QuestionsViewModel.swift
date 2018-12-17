//
//  QuestionsViewModel.swift
//  blissProject
//
//  Created by André Nogueira on 12/17/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit

class QuestionsViewModel: NSObject {

    var questions: [Question] = []
    
    func fetchQuestions(completion: @escaping (_ success: Bool, _ error: Error?) -> Void){
        NetworkManager.shared.fetchQuestions { (questions, error) in
            self.questions.append(contentsOf: questions)
            completion(true, nil)
            print("FETCHED \(questions)")
        }
    }
}
