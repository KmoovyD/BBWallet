//
//  CustomTabBarContainer.swift
//  M
//
//  Created by Дмитрий Спичаков on 31.10.2022.
//

import SwiftUI

struct CustomTabBarContainerView<Content:View>: View {
    
    // MARK: PROPERTIES
//    @EnvironmentObject private var selectViewModel: GlobalSelectNFT
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    // MARK: BODY
    var body: some View {
            ZStack(alignment: .bottom) {
                content
                    .ignoresSafeArea()
                
//                if selectViewModel.showTabBar {
                    CustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
                    .offset(y: height / 24.06)
//                }
            }
            .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
                self.tabs = value
        }
    }
}


// MARK: PREVIEW
struct CustomTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [.home, .wallet, .rewards, .browser, .profile]
    
    static var previews: some View {
        CustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
                .ignoresSafeArea()
        }
    }
}
