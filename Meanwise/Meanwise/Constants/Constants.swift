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
    
    struct StoryboardId {
        static let ImagePostExpanded = "ImagePostExpandedViewController"
        static let VideoPost = "VideoPostViewController"
        static let PostScroll = "PostScrollViewController"
        static let NewPost = "NewPostViewController"
        static let ChooseChannel = "ChooseChannelViewController"
    }
    
    struct TableViewCell {
        static let Textfield = "TextfieldTableViewCell"
        static let Title = "TitleTableViewCell"
        static let Dropdown = "DropdownTableViewCell"
        static let Skill = "SkillTableViewCell"
        static let Spacer = "SpacerTableViewCell"
        static let Tags = "TagsTableViewCell"
        static let Textview = "TextviewTableViewCell"
        static let UploadImage = "UploadImageTableViewCell"
        static let Invite = "InviteTableViewCell"
        static let Replies = "RepliesTableViewCell"
        static let HomeFeed = "HomeFeedCell"
        static let ImagePost = "ImagePostCell"
        static let VideoPost = "VideoPostCell"
        static let Channel = "ChannelTableViewCell"
    }
    
    struct CollectionViewCell {
        static let Image = "ImageCellIdentifier"
    }
    
    struct AnimationDurations {
        static let Fast: NSTimeInterval = 1.0
        static let Medium: NSTimeInterval = 3.0
        static let Slow: NSTimeInterval = 5.0
    }
    
    struct SegueIdentifiers {
        static let SignupMore = "ToSignupMoreViewController"
        static let SignupSkills = "ToSignupSkillsViewController"
        static let Dropdown = "ToDropdownViewController"
        static let SignupInterests = "ToSignupInterestsViewController"
        static let SignupProfile = "ToSignupProfileViewController"
        static let SignupAppearance = "ToSignupAppearanceViewController"
        static let SignupInvite = "ToSignupInviteViewController"
        static let LoginEmail = "ToLoginEmailViewController"
        static let ForgotPassword = "ToForgotPasswordViewController"
        static let ImagePostExpanded = "ToImagePostExpandedViewController"
        static let PostScroll = "ToPostScrollVoewController"
    }

    struct UnWindSegueIdentifiers {
        static let UnWindSignupMore = "UnWindToSignupMoreViewController"
        static let UnWindSignupSkills = "UnWindToSignupSkillsViewController"
        static let UnWindSignupInterests = "UnWindToSignupInterestsViewController"
        static let UnWindSignupProfile = "UnWindToSignupProfileViewController"
        static let UnWindSignupAppearance = "UnWindToSignupAppearanceViewController"
        static let UnWindSignupInvite = "UnWindToSignupInviteViewController"
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