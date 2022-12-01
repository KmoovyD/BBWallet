//
//  RewardsView.swift
//  BBWallet
//
//  Created by Leo Friskey on 01.12.2022.
//

import SwiftUI

struct RewardsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("reward_center_bg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: flexWidth(1144), height: flexHeight(96))
                        .padding(.vertical)
                    VStack(spacing: 0) {
                        Text("Featured")
                            .fontWeight(.bold)
                            .font(.title2)
                            .frame(width: width, height: flexHeight(47))
                            .background {
                                LinearGradient.rewardViewTextBG
                            }
                        ZStack {
                            Image("reward_featured_bg")
                                .resizable()
                                .scaledToFit()
                                .frame(width: flexWidth(393), height: flexHeight(300))
                            VStack {
                                
                                // MARK: featured car
                                ZStack {
                                    HStack {
                                        ZStack(alignment: .bottom) {
                                            Image("gelandewagen")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: flexWidth(236), height: flexHeight(194))
                                                .shadow(color: .black.opacity(0.5), radius: 10, x: 14, y: 14)
                                                .shadow(color: .black.opacity(0.5), radius: 10, x: -7, y: -7)
                                            Button {
                                                // learn more
                                            } label: {
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .fill(LinearGradient(colors: [.black, .init(red: 69/255, green: 68/255, blue: 70/255)], startPoint: .topTrailing, endPoint: .bottomLeading))
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .fill(LinearGradient(colors: [.init(red: 255/255, green: 167/255, blue: 26/255), .clear], startPoint: .trailing, endPoint: .leading))
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(Color(red: 255/255, green: 167/255, blue: 26/255))
                                                    Text("LEARN MORE")
                                                        .font(.title3)
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                }
                                                .frame(width: flexWidth(236), height: flexHeight(33.5))
                                                .shadow(color: .black.opacity(0.5), radius: 10, x: 14, y: 14)
                                                .shadow(color: .black.opacity(0.5), radius: 10, x: -7, y: -7)
                                            }
                                        }
                                        Spacer()
                                        VStack {
                                            Text("HUGE Geländewagen Giveway")
                                                .font(.system(size: 12))
                                                .multilineTextAlignment(.center)
                                                .padding(5)
                                                .background {
                                                    Color.black.opacity(0.5)
                                                        .cornerRadius(20)
                                                }
                                                .padding(.horizontal, 10)
                                            
                                            Text("Just by subscribing to all BB social media you’ll have the chance to win Mercedes-Benz Geländewagen")
                                                .font(.system(size: 10))
                                                .fontWeight(.light)
                                                .padding(8)
                                                .background {
                                                    Color.black.opacity(0.5)
                                                        .cornerRadius(20)
                                                }
                                                .padding(.horizontal, 10)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                }
                                .frame(width: flexWidth(359), height: flexHeight(194))
                                .background {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color(red: 32/255, green: 32/255, blue: 32/255))
                                }
                                
                                // swicther
                                ZStack {
                                    RoundedRectangle(cornerRadius: 18)
                                        .fill(.black.opacity(0.75))
                                        .frame(width: flexWidth(321), height: flexHeight(28))
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(.black)
                                        .frame(width: flexWidth(321), height: flexHeight(28))
                                    HStack {
                                        Button {
                                            // previous item
                                        } label: {
                                            ZStack {
                                                Circle()
                                                    .fill(LinearGradient(colors: [.init(red: 11/255, green: 10/255, blue: 10/255), .init(red: 24/255, green: 25/255, blue: 27/255)], startPoint: .bottomTrailing, endPoint: .topLeading))
                                                    .frame(width: flexWidth(37), height: flexHeight(37))
                                                Image("arrow_switcher")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: flexWidth(21))
                                                    .offset(x: flexWidth(-1))
                                                
                                            }
                                            .shadow(radius: 2, x: 1, y: 1.5)
                                            .shadow(radius: 2, x: -1.5, y: -1.5)
                                        }
                                        Spacer()
                                        Text("BIG Giveaway")
                                            .fontWeight(.light)
                                        Spacer()
                                        Button {
                                            // next item
                                        } label: {
                                            ZStack {
                                                Circle()
                                                    .fill(LinearGradient(colors: [.init(red: 11/255, green: 10/255, blue: 10/255), .init(red: 24/255, green: 25/255, blue: 27/255)], startPoint: .bottomTrailing, endPoint: .topLeading))
                                                    .frame(width: flexWidth(37), height: flexHeight(37))
                                                Image("arrow_switcher")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: flexWidth(21))
                                                    .offset(x: flexWidth(-1))
                                                    .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
                                                
                                            }
                                            .shadow(radius: 2, x: 1, y: 1.5)
                                            .shadow(radius: 2, x: -1.5, y: -1.5)
                                        }
                                    }
                                    .frame(width: flexWidth(354))
                                }
                            }
                        }
                        
                        Text("Contests")
                            .fontWeight(.bold)
                            .font(.title2)
                            .frame(width: width, height: flexHeight(47))
                            .background {
                                LinearGradient.rewardViewTextBG
                            }
                        
                        ZStack {
                            VStack(spacing: 12) {
                                ContestPreview(image: "moovy_gleam_pic", title: "Moovy Gleam Reward", days: "21h")
                                ContestPreview(image: "btc_offering_pic", title: "BBT Offering Giveaway", days: "3d")
                                ContestPreview(image: "discover_bbsoft_pic", title: "Discover BBSoft", days: "12d")
                            }
                        }
                        .padding()
                    }
                    
                    Text("NFT Drops")
                        .fontWeight(.bold)
                        .font(.title2)
                        .frame(width: width, height: flexHeight(47))
                        .background {
                            LinearGradient.rewardViewTextBG
                        }
                    
                    Button {
                        //
                    } label: {
                        Image("nft_drop_pic")
                            .resizable()
                            .scaledToFit()
                            .frame(width: flexWidth(359), height: flexHeight(256))
                            .padding(.vertical)
                    }
                    
                    HStack {
                        Text("Marathons")
                            .fontWeight(.bold)
                            .font(.title2)
                            .padding(.leading)
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color(red: 32/255, green: 32/255, blue: 32/255))
                            HStack {
                                Text("Available")
                                    .fontWeight(.light)
                                    .font(.system(size: 12))
                                Image("bbcoin_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: flexWidth(25), height: flexHeight(25))
                                    .shadow(radius: 2, x: 1.5, y: 1)
                                Text("+3")
                                    .fontWeight(.bold)
                                    .font(.system(size: 14))
                                    .shadow(color: .white, radius: 2)
                                
                            }
                        }
                        .frame(width: flexWidth(138), height: flexHeight(35))
                        .padding(.horizontal, 10)
                    }
                    .frame(width: width, height: flexHeight(47))
                    .background {
                        LinearGradient.rewardViewTextBG
                    }
                    
                    VStack(spacing: 20) {
                        Button {
                            //
                        } label: {
                            MarathonPreview(image: "marathon_launchparty_pic", barType: 1)
                        }
                        
                        Button {
                            //
                        } label: {
                            MarathonPreview(image: "marathon_garagerun_pic", barType: 2)
                        }
                        
                        Button {
                            //
                        } label: {
                            MarathonPreview(image: "marathon_typecollector_pic", barType: 3)
                        }
                    }
                    .padding(.vertical)
                    
                    Color.clear.frame(height: height * 0.2)
                }
            }
        }
    }
}

struct RewardsView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsView().environment(\.colorScheme, .dark)
    }
}

struct MarathonPreview: View {
    
    let image: String
    let barType: Int
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 32/255, green: 32/255, blue: 32/255))
            ZStack(alignment: .bottom) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: flexWidth(236), height: flexHeight(98))
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 14, y: 14)
                    .shadow(color: .black.opacity(0.5), radius: 10, x: -7, y: -7)
                ZStack(alignment: .leading) {
                    // bg
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(colors: [.black, .init(red: 26/255, green: 28/255, blue: 31/255)], startPoint: .leading, endPoint: .trailing))
                        .shadow(radius: 10, x: 14, y: 14)
                    // fill
                    if barType == 1 {
                        ZStack {
                            Rectangle()
                                .fill(LinearGradient(colors: [.init(red: 63/255, green: 62/255, blue: 64/255), .init(red: 69/255, green: 68/255, blue: 70/255)], startPoint: .trailing, endPoint: .leading))
                            Rectangle()
                                .fill(
                                    LinearGradient(colors: [.init(red: 33/255, green: 231/255, blue: 214/255), .init(red: 33/255, green: 231/255, blue: 214/255, opacity: 0)], startPoint: .trailing, endPoint: .leading)
                                )
                            Rectangle()
                                .stroke(LinearGradient(colors: [.init(red: 33/255, green: 231/255, blue: 214/255), .init(red: 33/255, green: 231/255, blue: 214/255, opacity: 0)], startPoint: .trailing, endPoint: .leading), lineWidth: 2)
                        }
                        .cornerRadius(20, corners: [.topLeft, .bottomLeft])
                        .frame(width: flexWidth(236 * 0.34), height: flexHeight(30))
                        //.cornerRadius((width * 0.77 * resultValue) <= 280 ? 0 : (width * 0.77 * resultValue) <= 290 ? 10 : 20, corners: [.topRight, .bottomRight])
                        
                        HStack {
                            Spacer()
                            Text("50.4km / 150km")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    } else if barType == 2 {
                        HStack {
                            Spacer()
                            Text("0/1")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    } else {
                        ZStack {
                            Rectangle()
                                .fill(LinearGradient(colors: [.init(red: 63/255, green: 62/255, blue: 64/255), .init(red: 69/255, green: 68/255, blue: 70/255)], startPoint: .trailing, endPoint: .leading))
                            Rectangle()
                                .fill(
                                    LinearGradient(colors: [.init(red: 33/255, green: 231/255, blue: 214/255), .init(red: 33/255, green: 231/255, blue: 214/255, opacity: 0)], startPoint: .trailing, endPoint: .leading)
                                )
                            Rectangle()
                                .stroke(LinearGradient(colors: [.init(red: 33/255, green: 231/255, blue: 214/255), .init(red: 33/255, green: 231/255, blue: 214/255, opacity: 0)], startPoint: .trailing, endPoint: .leading), lineWidth: 2)
                        }
                        .cornerRadius(20, corners: [.topLeft, .bottomLeft])
                        .frame(width: flexWidth(236 * 0.5), height: flexHeight(30))
                        
                        HStack {
                            Spacer()
                            Text("2/4")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                        }
                    }
                }
                .frame(width: flexWidth(236), height: flexHeight(30))
            }
            HStack {
                Spacer()
                VStack(spacing: 5) {
                    Text("Reward for completion")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                        .multilineTextAlignment(.center)
                    HStack {
                        Image("bbcoin_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: flexWidth(34), height: flexHeight(34))
                        Text("+1")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(color: .white, radius: 2)
                    }
                }
                .frame(width: flexWidth(125))
            }
        }
        .frame(width: flexWidth(359), height: flexHeight(98))
    }
}

struct ContestPreview: View {
    
    let image: String
    let title: String
    let days: String
    let text: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color(red: 32/255, green: 32/255, blue: 32/255))
                HStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: flexWidth(130), height: flexHeight(74))
                    Spacer()
                    VStack {
                        HStack {
                            Text(title)
                                .font(.system(size: 11))
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 8)
                                .background {
                                    Color.black.opacity(0.5)
                                        .cornerRadius(20)
                                }
                                .padding(.trailing, 5)
                                .foregroundColor(.primary)
                            Spacer()
                            Text(days)
                                .font(.system(size: 12))
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 8)
                                .background {
                                    Color.black.opacity(0.5)
                                        .cornerRadius(20)
                                }
                                .foregroundColor(.primary)
                        }
                        Text(text)
                            .font(.system(size: 10))
                            .fontWeight(.light)
                            .foregroundColor(.secondary)
                    }
                }
                .frame(width: flexWidth(328), height: flexHeight(74))
            }
            .frame(width: flexWidth(359), height: flexHeight(104))
        }
    }
}
