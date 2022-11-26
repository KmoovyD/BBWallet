//
//  HomeView.swift
//  BBWallet
//
//  Created by Kirill Drozdov on 26.11.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            Image("home")
                .resizable()
                .frame(width: width, height: height / 0.475)
        }
        .ignoresSafeArea()
    }

}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
