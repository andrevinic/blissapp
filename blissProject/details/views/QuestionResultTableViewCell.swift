//
//  QuestionResultTableViewCell.swift
//  blissProject
//
//  Created by André Nogueira on 12/21/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit

class QuestionResultTableViewCell: UITableViewCell {

    @IBOutlet weak var language: UILabel!
    
    var votes = 0
    var choice: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func configureCell(language: String, votes: Int, totalVotes: Int){
        self.language.text = language
        self.votes = votes
        self.choice = language
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}
