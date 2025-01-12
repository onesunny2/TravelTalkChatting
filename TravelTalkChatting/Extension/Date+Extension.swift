//
//  Date+Extension.swift
//  TravelTalkChatting
//
//  Created by Lee Wonsun on 1/12/25.
//

import Foundation

extension Date {
    
    func DateToString() -> String {
        String.dateformatter.dateFormat = "yyyy-MM-dd HH:mm"
        let newDate = String.dateformatter.string(from: self)
        
        return newDate
    }
    
}
