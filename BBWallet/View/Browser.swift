//
//  Browser.swift
//  BBWallet
//
//  Created by Kirill Drozdov on 26.11.2022.
//

import SwiftUI

struct Browser: View {
    var body: some View {
        WebView(url: URL(string: "https://bbsoft.io")!)
            .ignoresSafeArea()
    }
}

struct Browser_Previews: PreviewProvider {
    static var previews: some View {
        Browser()
    }
}
