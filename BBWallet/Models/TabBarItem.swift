//
//  TabBarItem.swift
//  M
//
//  Created by Дмитрий Спичаков on 31.10.2022.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case rides, garage, market, profile
    
    var iconName: String {
        switch self {
        case .rides: return "arrow.triangle.branch"
        case .garage: return "car.2"
        case .market: return "cart"
        case .profile: return "person.fill"
        }
    }
    
    var title: String {
        switch self {
        case .rides: return "Rides"
        case .garage: return "Garage"
        case .market: return "Market"
        case .profile: return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .rides, .garage, .market, .profile: return Color.theme.accent
        }
    }
    
}
