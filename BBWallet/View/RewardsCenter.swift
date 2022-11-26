//
//  RewardsCenter.swift
//  BBWallet
//
//  Created by Kirill Drozdov on 26.11.2022.
//

import SwiftUI

struct RewardsCenter: View {
    var body: some View {
        ScrollView{
            Image("RewardsCenter")
                .resizable()
                .frame(width: width, height: height / 0.497)
        }
        .ignoresSafeArea()
    }
}

struct RewardsCenter_Previews: PreviewProvider {
    static var previews: some View {
        RewardsCenter()
    }
}
