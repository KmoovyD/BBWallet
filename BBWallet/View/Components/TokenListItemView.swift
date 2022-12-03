//
//  TokenListItemView.swift
//  BBWallet
//
//  Created by Leo Friskey on 03.12.2022.
//

import SwiftUI

struct TokenListItemView: View {
    
    let image: String
    let title: String
    let code: String
    let value: String
    let changeValue: String
    let changePercent: String
    
    var body: some View {
        Button {
            
        } label: {
            HStack(spacing: 20) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: flexWidth(46), height: flexHeight(46))
                VStack(alignment: .leading, spacing: 3) {
                    Text(code)
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                    Text(title)
                        .font(.system(size: 12))
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(value)
                        .font(.system(size: 24))
                        .fontWeight(.heavy)
                    HStack {
                        Text(changeValue)
                        Text(changePercent)
                            .foregroundColor(.secondary)
                    }
                    .font(.system(size: 14))
                }
            }
            .frame(width: UIScreen.width * 0.86)
        }
        .tint(.white)
    }
}

struct TokenListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TokenListItemView(image: "bbcoin_icon", title: "BBtoken", code: "BBT", value: "0.034", changeValue: "$1,35", changePercent: "+0.9%").environment(\.colorScheme, .dark)
            .background {
                Color.black.frame(width: width, height: height)
                    .ignoresSafeArea()
            }
    }
}
