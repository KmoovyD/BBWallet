//
//  WebView.swift
//  BBWallet
//
//  Created by Leo Friskey on 03.12.2022.
//

import SwiftUI

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(request: URLRequest(url: URL(string: "https://bbsoft.io")!))
    }
}
