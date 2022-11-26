//
//  LoginView.swift
//  BBWallet
//
//  Created by Leo Friskey on 24.11.2022.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("bbwalletBG")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack(spacing: 15) {
                    Spacer()
                    Text("Create BBWallet account or sign into an existing one")
                        .font(.system(size: 15))
                        .padding(.vertical)
                    NavigationLink {
                        SigninView()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 255/255, green: 167/255, blue: 1/255))
                                .frame(width: UIScreen.width * 0.9, height: 50)
                            Text("Sign in")
                                .font(.custom("Fact", size: 20))
                                .foregroundColor(.white)
                        }
                    }
                    NavigationLink {
                        SignupView()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 2)
                                .frame(width: UIScreen.width * 0.9, height: 50)
                            Text("Sign up")
                                .font(.custom("Fact", size: 20))
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
