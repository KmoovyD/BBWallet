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
    var y = 50
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            HomeView()
                .tabBarItem(tab: .home, selection: $tabSelection)
//                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            WalletView()
                .tabBarItem(tab:  .wallet, selection: $tabSelection)
//                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            RewardsCenter()
                .tabBarItem(tab: .rewards, selection: $tabSelection)
//                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            Browser()
                .tabBarItem(tab: .browser, selection: $tabSelection)
//                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            ProfileView()
                .tabBarItem(tab: .profile, selection: $tabSelection)
//                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
