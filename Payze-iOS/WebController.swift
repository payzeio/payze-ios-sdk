//
//  WebController.swift
//  PaySms
//
//  Created by Irakli Shelia on 08.12.21.
//

import Foundation
import WebKit
import UIKit


protocol WebControllerDelegate {
    func redirected(with result: TwoFAResponse)
}

class MyWebView: UIView, WKNavigationDelegate {
    private let webView: WKWebView = WKWebView()
    var webDelegate: WebControllerDelegate?
    var iFrameUrl: String
    
    init(url: String) {
        iFrameUrl = url
        super.init(frame: .zero)
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let webView = WKWebView(frame: frame)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight] //It assigns Custom View height and width
        webView.navigationDelegate = self
        addSubview(webView)
        
//        let url = URL(string: "https://bit.ly/31zMptg")!
        guard let url = URL(string: iFrameUrl) else { return }
        
        webView.load(URLRequest(url: url))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        if webView.url?.absoluteString.contains("payze.io") != nil {
            webDelegate?.redirected(with: .success(true))
            print("Redirected")
        } else {
            webDelegate?.redirected(with: .failure(HTTPNetworkError.badRequest))
            print("Failed to redirect")
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // testing
        // webDelegate?.redirected(with: .failure(HTTPNetworkError.badRequest))
//        webDelegate?.redirected(with: .success(true))
        print("finished loading")
    }
}
