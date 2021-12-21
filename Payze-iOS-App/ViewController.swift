//
//  ViewController.swift
//  Payze-iOS-App
//
//  Created by Irakli Shelia on 20.12.21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var cardView: UIView!
    
    private let myService = PaymentService()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupCardView()
    }
    
    @available(iOS 13.0, *)
    @IBSegueAction func addSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: CardView())
    }
    
    @objc func cardViewClicked(sender: UITapGestureRecognizer) {
        print(#function)
        view.backgroundColor = .green
        self.myService.startPayment(paymentDetails: PaymentDetails.mock) { result in
            print(result)
        }
    }
    
    private func setupCardView() {
        cardView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(cardViewClicked(sender:)))
        cardView.addGestureRecognizer(gesture)
    }
    
    deinit {
        print("View Controller deinited")
    }
}

