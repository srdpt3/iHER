//
//  Extension.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//

import SwiftUI


import Foundation
import SwiftUI

extension String {
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

func timeAgoSinceDate(_ date:Date, currentDate:Date, numericDates:Bool) -> String {
    let calendar = Calendar.current
    let now = currentDate
    let earliest = (now as NSDate).earlierDate(date)
    let latest = (earliest == now) ? date : now
    let components:DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.minute , NSCalendar.Unit.hour , NSCalendar.Unit.day , NSCalendar.Unit.weekOfYear , NSCalendar.Unit.month , NSCalendar.Unit.year , NSCalendar.Unit.second], from: earliest, to: latest, options: NSCalendar.Options())
    
    if (components.year! >= 2) {
        return "\(components.year!) 년 전"
    } else if (components.year! >= 1){
        if (numericDates){ return "1년 전"
        } else { return "Last year" }
    } else if (components.month! >= 2) {
        return "\(components.month!)months ago"
    } else if (components.month! >= 1){
        if (numericDates){ return "a month ago"
        } else { return "Last month" }
    } else if (components.weekOfYear! >= 2) {
        return "\(components.weekOfYear!)weeks ago"
    } else if (components.weekOfYear! >= 1){
        if (numericDates){ return "a week ago"
        } else { return "Last week" }
    } else if (components.day! >= 2) {
        return "\(components.day!)days ago"
    } else if (components.day! >= 1){
        if (numericDates){ return "yesterday"
        } else { return "Yesterday" }
    } else if (components.hour! >= 2) {
        return "\(components.hour!)hours ago"
    } else if (components.hour! >= 1){
        if (numericDates){ return "an hour ago"
        } else { return "An hour ago" }
    } else if (components.minute! >= 2) {
        return "\(components.minute!)mins ago"
    } else if (components.minute! >= 1){
        if (numericDates){ return "a min ago"
        } else { return "A minute ago" }
    } else if (components.second! >= 3) {
        return "\(components.second!)seconds ago"
    } else { return "Just now" }
}

extension Array {
       func splited(into size:Int) -> [[Element]] {
         
         var splittedArray = [[Element]]()
         if self.count >= size {
                 
             for index in 0...self.count {
                if index % size == 0 && index != 0 {
                    splittedArray.append(Array(self[(index - size)..<index]))
                } else if(index == self.count) {
                    splittedArray.append(Array(self[index - 1..<index]))
                }
             }
         } else {
             splittedArray.append(Array(self[0..<self.count]))
         }
         return splittedArray
     }
}

extension String {
    func splitStringToArray() -> [String] {
        let trimmedText = String(self.filter { !" \n\t\r".contains($0) })
        var substringArray: [String] = []
        for (index, _) in trimmedText.enumerated() {
            let prefixIndex = index + 1
            let substringPrefix = String(trimmedText.prefix(prefixIndex)).lowercased()
            substringArray.append(substringPrefix)
        }
        return substringArray
    }
}

extension Encodable {
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}

extension Decodable {
    init(fromDictionary: Any) throws {
        let data = try JSONSerialization.data(withJSONObject: fromDictionary, options: JSONSerialization.WritingOptions.prettyPrinted)
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}


extension Dictionary {
    subscript(i:Int) -> (key: Key, value: Value) {
        get {
            return self[index(startIndex, offsetBy : i)];
        }
    }
}



extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}
