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
    
    func fetchQuestions(){
        NetworkManager.shared.fetchQuestions { (questions, error) in
            self.questions = questions
        }
    }
}
