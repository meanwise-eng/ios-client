//
//  String.swift
//  Meanwise
//
//  Created by Vishal on 26/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import Foundation
import UIKit

// MARK: String

extension String {

    //compute the length of string
    var length: Int {
        return self.characters.count
    }

    //returns characters of a string up to a specified index
    func substringToIndex(to: Int) -> String {
        return self.substringToIndex(self.startIndex.advancedBy(to))
    }

    //return a character at a specific index
    func stringAtIndex(position: Int) -> String {
        return String(Array(self.characters)[position])
    }

    //replace string content
    func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement)
    }

    //removes empty string content
    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "")
    }

    //insert a string at a specified index
    func insertSubstring(string:String, index:Int) -> String {
        return  String(self.characters.prefix(index)) + string + String(self.characters.suffix(self.characters.count-index))
    }

    //convert a string into a character array
    func characters() ->Array<Character>! {
        return Array(self.characters)
    }

    //reverse string order
    func reverse() -> String! {
        return String(self.characters.reverse())
    }

    func isValidEmailAddress() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluateWithObject(self)
        return result
    }

}

