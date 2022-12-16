//
//  WebView.swift
//  VinylsSwiftUI
//
//  Created by Ludovic Ollagnier on 16/12/2022.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {

    let url: URL

    init(url: URL) {
        self.url = url
    }

    // Create the view
    func makeUIView(context: Context) -> WKWebView {
        print("makeUIView")
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    // Update the view
    func updateUIView(_ uiView: WKWebView, context: Context) {
        print("updateUIView")
        uiView.load(URLRequest(url: url))
    }
}
