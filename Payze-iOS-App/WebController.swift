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
        
        // TODO Add Close button for the user to be able to close this page
        // TODO handle close button scenario. What webView delegate should return if user closes the webView.
        iFrameUrl = url
        super.init(frame: .zero)
        setupWebView()
        setupCloseButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupWebView() {
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        let webView = WKWebView(frame: frame)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight] //It assigns Custom View height and width
        webView.navigationDelegate = self
        self.addSubview(webView)
        guard let url = URL(string: iFrameUrl) else { return }
        webView.load(URLRequest(url: url))
    }
    
    private func setupCloseButton() {
        let button = UIButton(type: .system) as UIButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.setTitle("X", for: .normal)
        button.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        button.backgroundColor = .purple
        button.layer.cornerRadius = 15
        self.addSubview(button)
        button.topAnchor.constraint(equalTo: self.topAnchor, constant: 35).isActive = true
        button.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -25).isActive = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(closeClicked(sender:)))
        button.addGestureRecognizer(gesture)
    }
    
    @objc func closeClicked(sender: UITapGestureRecognizer) {
        webDelegate?.redirected(with: .failure(HTTPNetworkError.userClosed))
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
    
    // TODO: Delete this method. Needed only for testing
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // testing
        // webDelegate?.redirected(with: .failure(HTTPNetworkError.badRequest))
        //        webDelegate?.redirected(with: .success(true))
        print("finished loading")
    }
}


