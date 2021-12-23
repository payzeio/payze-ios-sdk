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
    
    @IBOutlet private weak var cardNumberTxtField: UITextField!
    @IBOutlet private weak var cardHolderTxtField: UITextField!
    @IBOutlet private weak var cvvTxtField: UITextField!
    @IBOutlet private weak var monthTxtField: UITextField!
    @IBOutlet private weak var yearTxtField: UITextField!
    @IBOutlet private weak var transactionIDTxtField: UITextField!
    
    private let myService = PaymentService()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupCardView()
    }
    
    @available(iOS 13.0, *)
    @IBSegueAction func addSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: CardView())
    }
    @IBAction func makePayment(_ sender: Any) {
        guard let paymentDetails = PaymentDetails.init(number: cardNumberTxtField.text, cardHolder: cardHolderTxtField.text, expirationDate: makeExpirationDate(s1: monthTxtField.text, s2: yearTxtField.text), securityNumber: cvvTxtField.text, transactionId: transactionIDTxtField.text, billingAddress: "") else { return }
        
        myService.startPayment(paymentDetails: paymentDetails) { result in
            print(result)
        }
    }

    @objc func cardViewClicked(sender: UITapGestureRecognizer) {
        myService.startPayment(paymentDetails: PaymentDetails.mock) { result in
            print(result)
        }
    }
    
    private func setupCardView() {
        cardView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(cardViewClicked(sender:)))
        cardView.addGestureRecognizer(gesture)
    }
    
    private func makeExpirationDate(s1: String?, s2: String?) -> String? {
        guard let s1 = s1 else { return ""}
        guard let s2 = s2 else { return ""}
        return s1 + "/" + s2
        
    }
    
    deinit {
        print("View Controller deinited")
    }
}

