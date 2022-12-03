//
//  ProfileView.swift
//  BBWallet
//
//  Created by Leo Friskey on 03.12.2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                //MARK: Header & avatar
                ZStack {
                    // bg
                    Image("wallet_buttons_bg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: width, height: flexHeight(54))
                    // logo
                    Button {
                        
                    } label: {
                        ZStack(alignment: .bottom) {
                            Image("user_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: flexWidth(116), height: flexHeight(116))
                                .overlay {
                                    Circle()
                                        .stroke(.white, lineWidth: 2)
                                }
                            ZStack {
                                Circle()
                                    .fill(.ultraThinMaterial)
                                    .frame(width: 28, height: 28)
                                Image(systemName: "arrow.triangle.2.circlepath")
                                    .font(.system(size: 14))
                                    .shadow(color: .white, radius: 2)
                                    .rotationEffect(.degrees(90))
                                    .foregroundColor(.white)
                            }
                            .offset(y: 10)
                        }
                    }
                }
                
                VStack {
                    Text("BBUser")
                        .foregroundColor(.orange)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Text("#56gY0ec")
                        .foregroundColor(.secondary)
                        .font(.system(size: 14))
                }
                .padding(.vertical)
                
                //MARK: Buttons
                VStack(spacing: 15) {
                    // Wallet Connect
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 36)
                                .stroke(Color(red: 255/255, green: 167/255, blue: 26/255), lineWidth: 2)
                            HStack {
                                Image("profile_button_connect")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: flexWidth(30), height: flexHeight(30))
                                Text("Wallet Connect")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                        }
                        .frame(width: flexWidth(362), height: flexHeight(50))
                    }
                    
                    // Others
                    ProfileButtonView(image: "profile_button_notifications", title: "Notifications")
                    ProfileButtonView(image: "profile_button_qr", title: "Scan QR Code")
                    ProfileButtonView(image: "profile_button_security", title: "Security")
                    ProfileButtonView(image: "profile_button_support", title: "Support")
                    ProfileButtonView(image: "profile_button_settings", title: "Settings")
                }
                .padding(.vertical)
                
                Spacer()
            }
            .padding(.vertical)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environment(\.colorScheme, .dark)
    }
}
