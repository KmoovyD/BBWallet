//
//  Color.swift
//  M
//
//  Created by Дмитрий Спичаков on 01.11.2022.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("accent")
}

extension LinearGradient {
    static let rewardViewTextBG = LinearGradient(colors: [.init(red: 11.0/255, green: 10.0/255, blue: 10.0/255), .init(red: 24.0/255, green: 25.0/255, blue: 27.0/255)], startPoint: .top, endPoint: .bottom)
}
