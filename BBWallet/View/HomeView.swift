//
//  HomeView.swift
//  BBWallet
//
//  Created by Leo Friskey on 29.11.2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showAmount = true
    
    var body: some View {
        NavigationView {
            VStack {
                //MARK: Header
                HStack {
                    Image("bb_user_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: flexWidth(40), height: flexHeight(40))
                        .overlay {
                            Circle().strokeBorder(.white, lineWidth: 2)
                        }
                    HStack(spacing: -10) {
                        Text("BBUser")
                            .foregroundColor(.orange)
                            .fontWeight(.bold)
                            .lineLimit(1)
                            .zIndex(1)
                        Image("home_header_bg")
                            .resizable()
                            .scaledToFit()
                            .frame(width: flexWidth(194), height: flexHeight(58))
                        Button {
                            //
                        } label: {
                            Image("home_bell")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22.45, height: 26)
                                .shadow(color: .white.opacity(0.8), radius: 2)
                        }
                    }
                    Button {
                        //
                    } label: {
                        Image("home_share")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                            .shadow(color: .white.opacity(0.8), radius: 2)
                    }
                    
                }
                ScrollView {
                    VStack {
                        VStack(spacing: flexHeight(-50)) {
                            // MARK: Social media
                            Button {
                                // discord && twitter
                            } label: {
                                Image("home_sm_banner")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: flexWidth(393), height: flexHeight(230))
                            }
                            
                            //MARK: Wallet Overview
                            ZStack {
                                Image("home_wallet_banner")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: flexWidth(422), height: flexHeight(235))
                                    .offset(x: flexWidth(8))
                                HStack {
                                    Spacer()
                                    Spacer()
                                    VStack {
                                        HStack {
                                            Button {
                                                withAnimation {
                                                    showAmount.toggle()
                                                }
                                            } label: {
                                                Image(systemName: showAmount ? "eye" : "eye.slash")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(.white.opacity(0.9))
                                            }
                                            if showAmount {
                                                Text("1400,00$")
                                                    .font(.system(size: 32))
                                                    .fontWeight(.bold)
                                            } else {
                                                RoundedRectangle(cornerRadius: 18)
                                                    .fill(.ultraThinMaterial)
                                                    .frame(width: flexWidth(150))
                                            }
                                        }
                                        .frame(height: flexHeight(44))
                                        HStack(spacing: 20) {
                                            SendRecieveButton(type: "send")
                                            SendRecieveButton(type: "recieve")
                                        }
                                    }
                                    Spacer()
                                }
                                .padding(.leading, flexWidth(30))
                            }
                        }
                        //MARK: Rewards
                        HomeSection(image: "home_trophey_icon", title: "REWARDS", height: 451) {
                            VStack(spacing: 10) {
                                RewardsPreview(image: "moovy_gleam_pic", title: "Moovy Gleam Reward", daysLeft: "3d")
                                
                                RewardsPreview(image: "btc_offering_pic", title: "BBT Offering Giveaway", daysLeft: "12d")
                            }
                            .padding(.bottom)
                        }
                        //MARK: NFT Drops
                        HomeSection(image: "home_cube_icon", title: "NFT DROPS", height: 259) {
                            HStack(spacing: 20) {
                                Button {
                                    
                                } label: {
                                    Image("home_nft_main_car")
                                        .resizable()
                                        .scaledToFit()
                                        .shadow(color: .white.opacity(0.2), radius: 10)
                                        .overlay(alignment: .bottom) {
                                            Text("Moovy Car Collection")
                                                .font(.system(size: 13))
                                                .padding(.vertical, 6)
                                                .padding(.horizontal, 9)
                                                .foregroundColor(.white)
                                                .background {
                                                    RoundedRectangle(cornerRadius: 18)
                                                        .fill(.black.opacity(0.5))
                                                }
                                                .padding(.bottom, 10)
                                        }
                                }
                                
                                VStack {
                                    Button {
                                        
                                    } label: {
                                        Image("home_nft_second_car")
                                            .resizable()
                                            .scaledToFit()
                                    }
                                    
                                    Button {
                                        
                                    } label: {
                                        Image("home_nft_third_car")
                                            .resizable()
                                            .scaledToFit()
                                            .overlay(alignment: .bottom) {
                                                HStack {
                                                    Spacer()
                                                    Text("+7 more")
                                                        .font(.system(size: 13))
                                                        .padding(.vertical, 6)
                                                        .padding(.horizontal, 9)
                                                        .foregroundColor(.white)
                                                        .background {
                                                            RoundedRectangle(cornerRadius: 18)
                                                                .fill(.black.opacity(0.5))
                                                        }
                                                        .padding(.bottom, 10)
                                                }
                                                .padding(.trailing, 5)
                                            }
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .offset(y: -5)
                        }
                        
                        //MARK: BBPlace
                        HomeSection(image: "", title: "", height: 439, bbplace: true) {
                            VStack {
                                Image("home_bbplace_pic")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: flexWidth(340), height: flexHeight(240))
                                
                                Text("Moovy")
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                                    .font(.system(size: 10))
                                    .foregroundColor(.secondary)
                                    .padding(.horizontal, 8)
                                    .frame(height: flexHeight(50))
                                
                                Button {
                                    //
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 18)
                                            .fill(Color(red: 255/255, green: 167/255, blue: 26/255))
                                            .frame(width: flexWidth(319), height: flexHeight(47))
                                            .shadow(radius: 5, x: 2, y: 3)
                                            .shadow(radius: 5, x: -3, y: -3)
                                        Text("LEARN MORE")
                                            .fontWeight(.bold)
                                            .font(.title2)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.bottom)
                                }
                            }
                        }
                        
                        //MARK: BBSoft.io
                        Button {
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 45)
                                    .fill(.ultraThinMaterial)
                                    .frame(width: UIScreen.width * 0.8, height: flexHeight(45))
                                Text("bbsoft.io")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .padding(.top)
                        }
                        
                        Color.clear.frame(height: UIScreen.height * 0.1)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.colorScheme, .dark)
    }
}

fileprivate struct HomeSection<Content: View>: View {
    
    let image: String
    let title: String
    let height: Double
    let bbplace: Bool
    let content: Content
    
    init(image: String, title: String, height: Double, bbplace: Bool = false,  @ViewBuilder content: () -> Content) {
        self.image = image
        self.title = title
        self.height = height
        self.bbplace = bbplace
        self.content = content()
    }
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(.ultraThinMaterial)
            VStack {
                ZStack {
                    HStack(spacing: flexWidth(-20)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 18)
                                .fill(LinearGradient(colors: [.init(red: 11.0/255, green: 10.0/255, blue: 10.0/255), .init(red: 24.0/255, green: 25.0/255, blue: 27.0/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: flexWidth(54), height: flexHeight(51))
                            Image(bbplace ? "home_bbplace_icon" : image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: flexWidth(36), height: flexHeight(36))
                                .shadow(color: .white, radius: bbplace ? 0 : 2)
                                .offset(x: bbplace ? 2 : 0)
                        }
                        .zIndex(1)
                        RoundedRectangle(cornerRadius: 18)
                            .fill( bbplace ? LinearGradient(colors: [.init(red: 255/255, green: 196/255, blue: 92/255), .init(red: 255/255, green: 196/255, blue: 92/255, opacity: 0.25)], startPoint: .top, endPoint: .bottom) : LinearGradient.almostBlack)
                            .frame(height: 25)
                            .padding(.trailing, flexWidth(24))
                    }
                    Text(bbplace ? "BBPLACE" : title)
                        .fontWeight(.bold)
                        .font(.title3)
                        .shadow(color: .white, radius: 2)
                }
                
                content
                
                Spacer()
            }
        }
        .padding(.horizontal, 20)
        .frame(height: flexHeight(height))
        .padding(.vertical)
    }
}

fileprivate struct RewardsPreview: View {
    
    let image: String
    let title: String
    let daysLeft: String
    
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                VStack {
                    Spacer()
                    HStack {
                        Text(title)
                            .font(.system(size: 14))
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(.black.opacity(0.5))
                            }
                        Spacer()
                        Text(daysLeft)
                            .font(.system(size: 14))
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .foregroundColor(.white)
                            .background {
                                RoundedRectangle(cornerRadius: 18)
                                    .fill(.black.opacity(0.5))
                            }
                    }
                    .padding(10)
                }
            }
            .frame(width: flexWidth(340), height: flexHeight(200))
        }
    }
}
