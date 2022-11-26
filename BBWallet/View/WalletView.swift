//
//  WalletView.swift
//  BBWallet
//
//  Created by Kirill Drozdov on 26.11.2022.
//

import SwiftUI

struct WalletView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                TokenSelection()
            } label: {
                Image("wallet")
                    .resizable()
                    .frame(width: width, height: height / 1.086)
                    .ignoresSafeArea()
            }
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}

struct TokenSelection: View {
    var body: some View {
        Image("tokenSelection")
            .resizable()
            .frame(width: width, height: height / 1.086)
            .ignoresSafeArea()
    }

}
