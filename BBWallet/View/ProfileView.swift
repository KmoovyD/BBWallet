//
//  ProfileView.swift
//  BBWallet
//
//  Created by Kirill Drozdov on 26.11.2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Image("profile")
            .resizable()
            .frame(width: width, height: height / 1.086)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
