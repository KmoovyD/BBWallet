//
//  BBWalletApp.swift
//  BBWallet
//
//  Created by Дмитрий Спичаков on 22.11.2022.
//

import SwiftUI

let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

@main
struct BBWalletApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
