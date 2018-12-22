//
//  UIColor.swift
//  blissProject
//
//  Created by André Nogueira on 12/21/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var mainColor: UIColor {
        return UIColor(colorWithHexValue: 0x4953ff)
    }
    static var textColor: UIColor {
        return .white
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    static var veryLightGray: UIColor {
        return UIColor(colorWithHexValue: 0xd9d9d9)
    }
    static var lightishGray: UIColor { return UIColor(colorWithHexValue: 0xc1c1c1) }
    static var veryDarkGray: UIColor { return UIColor(colorWithHexValue: 0x4A4A4A)}
    static var softYellow: UIColor { return UIColor(colorWithHexValue: 0xFCE57D) }
    static var veryDarkGrayishRed: UIColor { return UIColor(colorWithHexValue: 0x454343) }
    
}
