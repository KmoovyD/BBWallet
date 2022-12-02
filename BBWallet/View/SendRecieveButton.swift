//
//  SendRecieveButton.swift
//  BBWallet
//
//  Created by Leo Friskey on 02.12.2022.
//

import SwiftUI

struct SendRecieveButton: View {
    
    let type: String
    
    var body: some View {
        Button {
            
        } label: {
            VStack {
                ZStack {
                    Circle()
                        .fill(LinearGradient(colors: [.init(red: 11/255, green: 10/255, blue: 10/255), .init(red: 24/255, green: 25/255, blue: 27/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: flexWidth(57))
                        .shadow(radius: 2, x: 2, y: 3)
                        .shadow(radius: 2, x: -3, y: -3)
                    if type == "recieve" {
                        Image("recieve_button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: flexWidth(24), height: flexHeight(24))
                    } else {
                        Image("send_button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: flexWidth(24), height: flexHeight(24))
                    }
                }
                if type == "recieve" {
                    Text("Recieve")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                                .frame(width: 75, height: 20)
                        }
                } else {
                    Text("Send")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                                .frame(width: 65, height: 20)
                        }
                }
            }
        }
    }
}

struct SendRecieveButton_Previews: PreviewProvider {
    static var previews: some View {
        SendRecieveButton(type: "recieve").environment(\.colorScheme, .dark)
    }
}
