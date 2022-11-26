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
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.loggedIn == true {
                MainView()
            } else {
                LoginView()
                    .environmentObject(viewModel)
            }
        }
    }
}
