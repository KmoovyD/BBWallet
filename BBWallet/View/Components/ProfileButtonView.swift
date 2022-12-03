//
//  ProfileButtonView.swift
//  BBWallet
//
//  Created by Leo Friskey on 03.12.2022.
//

import SwiftUI

struct ProfileButtonView: View {
    
    let image: String
    let title: String
    
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 36)
                    .fill(LinearGradient(colors: [.init(red: 11/255, green: 10/255, blue: 10/255), .init(red: 24/255, green: 25/255, blue: 27/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                HStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: flexWidth(30), height: flexHeight(30))
                        .shadow(color: .white, radius: 2)
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            .frame(width: flexWidth(362), height: flexHeight(50))
        }
    }
}

struct ProfileButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileButtonView(image: "profile_button_notifications", title: "Notifications").environment(\.colorScheme, .dark)
            .background {
                Color.black
                    .frame(width: width, height: height)
                    .ignoresSafeArea()
            }
    }
}
