//
//  NFTListItemView.swift
//  BBWallet
//
//  Created by Leo Friskey on 03.12.2022.
//

import SwiftUI

struct NFTListItemView: View {
    
    let image: String
    let title: String
    let quantity: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: flexWidth(156), height: flexHeight(167))
            .cornerRadius(18)
            .overlay {
                RoundedRectangle(cornerRadius: 18)
                    .stroke(.ultraThinMaterial)
            }
            .overlay {
                VStack {
                    Spacer()
                    HStack(spacing: 0) {
                        Text(title)
                            .font(.system(size: 12))
                            .lineLimit(1)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(.black.opacity(0.5))
                            }
                        Spacer()
                        Text(quantity)
                            .font(.system(size: 12))
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(.black.opacity(0.5))
                            }
                    }
                }
                .padding(10)
            }
    }
}

struct NFTListItemView_Previews: PreviewProvider {
    static var previews: some View {
        NFTListItemView(image: "home_nft_main_car", title: "Moovy", quantity: "x9").environment(\.colorScheme, .dark)
            .background {
                Color.black.frame(width: width, height: height)
                    .ignoresSafeArea()
            }
    }
}
