//
//  TabBarItem.swift
//  M
//
//  Created by Дмитрий Спичаков on 31.10.2022.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, wallet, rewards, browser, profile
    
    var iconName: String {
        switch self {
        case .home: return "homeButton"
        case .wallet: return "walletButton"
        case .rewards: return "rewardsButton"
        case .browser: return "browserButton"
        case .profile: return "profileButton"
        }
    }
    
    var iconNameSelected: String {
        switch self {
        case .home: return "homeButtonSelected"
        case .wallet: return "walletButtonSelected"
        case .rewards: return "rewardsButtonSelected"
        case .browser: return "browserButtonSelected"
        case .profile: return "profileButtonSelected"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .wallet: return "Wallet"
        case .rewards: return "Rewards Center"
        case .browser: return "Browser"
        case .profile: return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .home, .wallet, .rewards, .browser, .profile: return Color.theme.accent
        }
    }
    
}
