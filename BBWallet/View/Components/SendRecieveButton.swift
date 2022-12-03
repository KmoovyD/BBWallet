//
//  SendRecieveButton.swift
//  BBWallet
//
//  Created by Leo Friskey on 02.12.2022.
//

import SwiftUI

struct SendRecieveButton: View {
    
    let type: String
    let circleSize: Double
    let imageSize: Double
    let fontSize: CGFloat
    let circleShadow: Bool
    
    init(type: String, circleSize: Double = 57, imageSize: Double = 24, fontSize: CGFloat = 15, circleShadow: Bool = false) {
        self.type = type
        self.circleSize = circleSize
        self.imageSize = imageSize
        self.fontSize = fontSize
        self.circleShadow = circleShadow
    }
    
    var body: some View {
        Button {
            
        } label: {
            VStack {
                ZStack {
                    Circle()
                        .fill(LinearGradient(colors: [.init(red: 11/255, green: 10/255, blue: 10/255), .init(red: 24/255, green: 25/255, blue: 27/255)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: flexWidth(circleSize))
                        .shadow(radius: 2, x: 2, y: 3)
                        .shadow(radius: 2, x: -3, y: -3)
                        .shadow(color: circleShadow ? .white.opacity(0.15) : .clear, radius: 5, x: -3, y: -3)
                    if type == "recieve" {
                        Image("recieve_button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: flexWidth(imageSize), height: flexHeight(imageSize))
                    } else {
                        Image("send_button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: flexWidth(imageSize), height: flexHeight(imageSize))
                    }
                }
                if type == "recieve" {
                    Text("Recieve")
                        .foregroundColor(.white)
                        .font(.system(size: fontSize))
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                                .frame(width: 75, height: circleShadow ? 24 : 20)
                        }
                } else {
                    Text("Send")
                        .foregroundColor(.white)
                        .font(.system(size: fontSize))
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                                .frame(width: circleShadow ? 75 : 65, height: circleShadow ? 24 : 20)
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
