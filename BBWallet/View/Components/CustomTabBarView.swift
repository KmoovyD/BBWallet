//
//  CustomTabBarView.swift
//  M
//
//  Created by Дмитрий Спичаков on 31.10.2022.
//

import SwiftUI

struct CustomTabBarView: View {
    
    // MARK: PROPERTIES
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    // MARK: BODY
    var body: some View {
        ZStack(alignment: .bottom) {
            tabBar
                .onChange(of: selection) { newValue in
                    withAnimation(.easeInOut) {
                        localSelection = newValue
                    }
                }
        }
        .ignoresSafeArea()
    }
}

// MARK: PREVIEW
struct CustomTabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [.home, .wallet, .rewards, .browser, .profile]
    
    static var previews: some View {
        VStack {
            Spacer()
            CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
        .ignoresSafeArea()
    }
}


// MARK: EXTENSION
extension CustomTabBarView {
    
    // TabBar button view
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(localSelection == tab ? tab.iconNameSelected : tab.iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 95, height: 95)
                .foregroundColor(.white)
            
            Text(tab.title)
                .font(.custom("Fact", size: 12))
                .foregroundColor(localSelection == tab ? .white : .gray)
                .offset(y:-25)
        }
    }
    
    // Tab bar
    private var tabBar: some View {
        HStack(spacing: -18) {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .background {
            Image("tabBarRectangle")
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
        }
        .frame(maxWidth: width)
    }
    
    // Buttons switch function
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
}

