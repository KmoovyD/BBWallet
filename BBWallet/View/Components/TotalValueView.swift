//
//  TotalValueView.swift
//  BBWallet
//
//  Created by Leo Friskey on 03.12.2022.
//

import SwiftUI

struct TotalValueView: View {
    
    @Binding var showAmount: Bool
    let fontSize: CGFloat
    
    var body: some View {
        HStack {
            Button {
                withAnimation {
                    showAmount.toggle()
                }
            } label: {
                Image(systemName: showAmount ? "eye" : "eye.slash")
                    .font(.system(size: fontSize / 2))
                    .foregroundColor(.white.opacity(0.9))
            }
            if showAmount {
                Text("1400,00$")
                    .font(.system(size: fontSize))
                    .fontWeight(.bold)
            } else {
                RoundedRectangle(cornerRadius: 18)
                    .fill(.ultraThinMaterial)
                    .frame(width: fontSize == 50 ? flexWidth(240) : flexWidth(150))
            }
        }
    }
}

struct TotalValueView_Previews: PreviewProvider {
    static var previews: some View {
        TotalValueView(showAmount: .constant(true), fontSize: 32).environment(\.colorScheme, .dark)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.black.opacity(0.8))
                    .frame(width: UIScreen.width, height: UIScreen.height)
                    .ignoresSafeArea()
            }
    }
}
