//
//  WalletView.swift
//  BBWallet
//
//  Created by Leo Friskey on 03.12.2022.
//

import SwiftUI

struct WalletView: View {
    @State private var walletType = "Main wallet"
    @State private var walletTypes = ["Main wallet", "Backup wallet", "Invest wallet"]
    @State private var showAmount = true
    
    @State private var showTokens = true
    
    var body: some View {
        NavigationView {
            VStack {
                //MARK: Picker
                Picker(walletType, selection: $walletType, content: {
                    ForEach(walletTypes, id: \.self) {
                        Text($0)
                    }
                })
                .tint(.secondary)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.ultraThinMaterial)
                }
                
                //MARK: Total value
                TotalValueView(showAmount: $showAmount, fontSize: 50)
                    .frame(height: flexHeight(70))
                
                //MARK: Buttons
                ZStack {
                    Image("wallet_buttons_bg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width, height: flexHeight(54))
                    HStack(spacing: 24) {
                        SendRecieveButton(type: "send", circleSize: flexWidth(69), imageSize: flexWidth(30), circleShadow: true)
                        SendRecieveButton(type: "recieve", circleSize: flexWidth(69), imageSize: flexWidth(30), circleShadow: true)
                        buyButton
                        swapButton
                    }
                    .padding(.top, flexHeight(28))
                    
                }
                
                //MARK: Tokens/NFTs picker
                ZStack {
                    LinearGradient.almostBlack
                        .frame(height: flexHeight(64))
                    HStack(spacing: 20) {
                        // tokens
                        Button {
                            showTokens = true
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(showTokens ? .white : .white.opacity(0.1))
                                    .frame(width: flexWidth(156), height: flexHeight(42))
                                Text("Tokens")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                    .font(.system(size: 16))
                            }
                        }
                        
                        // nft
                        Button {
                            showTokens = false
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(!showTokens ? .white : .white.opacity(0.1))
                                    .frame(width: flexWidth(156), height: flexHeight(42))
                                Text("NFT")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                    .font(.system(size: 16))
                            }
                        }
                    }
                }
                .padding(.vertical)
                
                if showTokens {
                    ScrollView {
                        VStack {
                            TokenListItemView(image: "bbcoin_icon", title: "BBtoken", code: "BBT", value: "0.034", changeValue: "$1,35", changePercent: "+0.9%")
                            Rectangle()
                                .fill(.white.opacity(0.2))
                                .frame(width: flexWidth(256), height: 1)
                            TokenListItemView(image: "moovycoin_icon", title: "$MOIL", code: "MOIL", value: "0.96", changeValue: "$0,96", changePercent: "+0.9%")
                            Rectangle()
                                .fill(.white.opacity(0.2))
                                .frame(width: flexWidth(256), height: 1)
                            TokenListItemView(image: "btccoin_icon", title: "Bitcoin", code: "BTC", value: "0.034", changeValue: "$20 857,10", changePercent: "+0.9%")
                            Rectangle()
                                .fill(.white.opacity(0.2))
                                .frame(width: flexWidth(256), height: 1)
                            TokenListItemView(image: "ethcoin_icon", title: "Ethereum", code: "ETH", value: "0.056", changeValue: "$1 628,79", changePercent: "+0.9%")
                            
                            Button {
                                // add token
                            } label: {
                                HStack {
                                    ZStack {
                                        Circle()
                                            .stroke(.white, lineWidth: 2)
                                            .frame(width: 30, height: 30)
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 15, height: 2)
                                        RoundedRectangle(cornerRadius: 20)
                                            .frame(width: 15, height: 2)
                                            .rotationEffect(.degrees(90))
                                    }
                                    Text("Add Tokens")
                                        .fontWeight(.bold)
                                }
                                .padding()
                            }
                            .tint(.white)
                            
                        }
                    }
                } else {
                    ScrollView {
                        VStack(spacing: 20) {
                            HStack(spacing: 20) {
                                NFTListItemView(image: "home_nft_main_car", title: "Moovy", quantity: "x9")
                                NFTListItemView(image: "wallet_nft_boredape", title: "Bored Ape", quantity: "x1")
                            }
                            HStack(spacing: 20) {
                                NFTListItemView(image: "wallet_nft_cryptopunk", title: "Crypto Punk", quantity: "x3")
                                NFTListItemView(image: "wallet_nft_everydays", title: "Everydays Astrounat", quantity: "x3")
                            }
                        }
                    }
                }
                Spacer()
            }
        }
    }
    
    private var buyButton: some View {
        Button {
            
        } label: {
            VStack {
                ZStack {
                    Circle()
                        .fill(LinearGradient(colors: [.init(red: 11/255, green: 10/255, blue: 10/255), .init(red: 24/255, green: 25/255, blue: 27/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: flexWidth(69))
                        .shadow(radius: 2, x: 2, y: 3)
                        .shadow(radius: 2, x: -3, y: -3)
                        .shadow(color: .white.opacity(0.15), radius: 5, x: -3, y: -3)
                    Image("button_buy_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: flexWidth(30), height: flexHeight(30))
                }
                Text("Buy")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.ultraThinMaterial)
                            .frame(width: 75, height: 24)
                    }
            }
        }
    }
    
    private var swapButton: some View {
        Button {
            
        } label: {
            VStack {
                ZStack {
                    Circle()
                        .fill(LinearGradient(colors: [.init(red: 11/255, green: 10/255, blue: 10/255), .init(red: 24/255, green: 25/255, blue: 27/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: flexWidth(69))
                        .shadow(radius: 2, x: 2, y: 3)
                        .shadow(radius: 2, x: -3, y: -3)
                        .shadow(color: .white.opacity(0.15), radius: 5, x: -3, y: -3)
                    Image("button_swap_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: flexWidth(30), height: flexHeight(30))
                }
                Text("Swap")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.ultraThinMaterial)
                            .frame(width: 75, height: 24)
                    }
            }
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView().environment(\.colorScheme, .dark)
    }
}
