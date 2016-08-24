//
//  Constants.swift
//  Meanwise
//
//  Created by Vishal on 23/08/16.
//  Copyright © 2016 Squelo. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Storyboard {
        static let Signup = "Signup"
        static let Introduction = "Introduction"
        static let Login = "Login"
        static let Home = "Home"
    }
    
    struct Xib {
        static let RootViewController = "RootViewController"
    }
    
    struct TableViewCell {
        static let TextfieldTableViewCell = "TextfieldTableViewCell"
        static let TitleTableViewCell = "TitleTableViewCell"
    }
    
    struct AnimationDurations {
        static let Fast: NSTimeInterval = 1.0
        static let Medium: NSTimeInterval = 3.0
        static let Slow: NSTimeInterval = 5.0
    }
    
    struct SegueIdentifiers {
        static let SignupMore = "ToSignupMoreViewController"
        static let SignupSkills = "ToSignupSkillsViewController"
    }
    
    struct UserDefaults {
        static let IsFirstTime = "IsFirstTime"
        static let IsUserLoggedIn = "IsUserLoggedIn"
    }
    
    struct StringConstant {
        static let True = "True"
        static let False = "False"
    }
    
}