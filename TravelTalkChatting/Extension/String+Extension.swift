//
//  Date+Extension.swift
//  TravelTalkChatting
//
//  Created by Lee Wonsun on 1/10/25.
//

import Foundation

extension String {
    
    static let dateformatter = DateFormatter()
    
    func stringToDateToString() -> String {
        String.dateformatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let newDate = String.dateformatter.date(from: self) else { return "" }
        
        String.dateformatter.dateFormat = "yy.MM.dd"
        let newString = String.dateformatter.string(from: newDate)
        
        return newString
    }

    func stringToDateToString2() -> String {
        String.dateformatter.locale = Locale(identifier: "ko_KR")
        String.dateformatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let newDate = String.dateformatter.date(from: self) else { return "" }
        
        String.dateformatter.dateFormat = "a HH:mm"
        let newString = String.dateformatter.string(from: newDate)
        
        return newString
    }
}
