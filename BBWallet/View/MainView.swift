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
    @State var tabSelection: TabBarItem =  .rides
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            Color.red
                .tabBarItem(tab: .rides, selection: $tabSelection)
//                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            Color.blue
                .tabBarItem(tab:  .garage, selection: $tabSelection)
//                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            Color.orange
                .tabBarItem(tab: .market, selection: $tabSelection)
//                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
            Color.green
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
