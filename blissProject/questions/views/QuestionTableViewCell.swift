//
//  QuestionTableViewCell.swift
//  blissProject
//
//  Created by André Nogueira on 12/17/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    @IBOutlet weak var imageQuestion: UIImageView!
    @IBOutlet weak var questionField: UILabel!
    
    func configureCell(imageQuestion: String, questionField: String){
        self.questionField.text = questionField
//        let replaced = imageQuestion.replacingOccurrences(of: "question", with: questionField)
        self.imageQuestion.download(image: imageQuestion, placeholder: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
