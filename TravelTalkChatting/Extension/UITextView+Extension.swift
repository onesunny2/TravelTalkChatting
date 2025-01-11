//
//  UITextView+Extension.swift
//  TravelTalkChatting
//
//  Created by Lee Wonsun on 1/12/25.
//

import UIKit

extension UITextView {
    
    func commonDesign(color: UIColor = .label, size: CGFloat = 16, weight: UIFont.Weight = .bold, line: Int = 1) {
        self.textColor = color
        self.font = .systemFont(ofSize: size, weight: weight)
        self.textAlignment = .left
    }
}