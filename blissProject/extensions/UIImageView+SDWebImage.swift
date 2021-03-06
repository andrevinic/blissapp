//
//  UIImageView+KingFisher.swift
//  themovies_project
//
//  Created by André Nogueira on 12/15/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import Foundation
import SDWebImage

extension UIImageView {
    func download(image url: String, placeholder: UIImage?) {
        guard let imageURL = URL(string:url) else {
            return
        }
        self.sd_setImage(with: imageURL, completed: nil)
    }
}
