//
//  ContentView.swift
//  BBWallet
//
//  Created by Дмитрий Спичаков on 22.11.2022.
//

import SwiftUI

struct MainView: View {
    
    // MARK: PROPERTIES
    @State private var selection: String = "home"
    @State var tabSelection: TabBarItem =  .home
    var test = 8
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            HomeView()
                .tabBarItem(tab: .home, selection: $tabSelection)
            WalletView()
                .tabBarItem(tab:  .wallet, selection: $tabSelection)
            RewardsCenter()
                .tabBarItem(tab: .rewards, selection: $tabSelection)
            Browser()
                .tabBarItem(tab: .browser, selection: $tabSelection)
            ProfileView()
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
