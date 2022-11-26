//
//  WebView.swift
//  BBWallet
//
//  Created by Kirill Drozdov on 26.11.2022.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    var url: URL

    internal func makeUIView(context: Context) -> WKWebView {
            return WKWebView()
    }

    internal func updateUIView(_ webView: WKWebView, context: Context) {
            let request = URLRequest(url: url)
            webView.load(request)
    }
}
