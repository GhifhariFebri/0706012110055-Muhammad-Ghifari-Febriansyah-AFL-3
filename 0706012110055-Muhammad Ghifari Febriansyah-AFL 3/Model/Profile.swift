//
//  Profile.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL 3
//
//  Created by MacBook Pro on 18/04/23.
//

import Foundation

//Model for profile
struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    //making default username for user
    static let `default` = Profile(username: "g_kumar")

    //setting available season
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
    }
}
