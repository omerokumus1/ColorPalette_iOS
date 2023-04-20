//
//  UIColor+Ext.swift
//  ColorPalette
//
//  Created by Ömer Faruk Okumuş on 19.04.2023.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: CGFloat.random(in: 0...1),
                       green: CGFloat.random(in: 0...1),
                       blue: CGFloat.random(in: 0...1),
                       alpha: 1)
    }
}
