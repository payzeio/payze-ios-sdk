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
    
    @IBOutlet weak var cardNumberTxtField: UITextField!
    @IBOutlet weak var cardHolderTxtField: UITextField!
    @IBOutlet weak var cvvTxtField: UITextField!
    @IBOutlet weak var monthTxtField: UITextField!
    @IBOutlet weak var yearTxtField: UITextField!
    @IBOutlet weak var transactionIdTxtField: UITextField!
    
    private let myService = PaymentService()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCardView()
        setupTxtFields()
    }
    
    @available(iOS 13.0, *)
    @IBSegueAction func addSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: CardView())
    }
    
    @IBAction func makePayment(_ sender: Any) {
        guard let paymentDetails = PaymentDetails.init(number: cardNumberTxtField.text, cardHolder: cardHolderTxtField.text, expirationDate: makeExpirationDate(s1: monthTxtField.text, s2: yearTxtField.text), securityNumber: cvvTxtField.text, transactionId: transactionIdTxtField.text, billingAddress: "") else { return }
        
        myService.startPayment(paymentDetails: paymentDetails) { result in
            print(result)
        }
    }
    
    @objc func cardViewClicked(sender: UITapGestureRecognizer) {
        print(#function)
        self.myService.startPayment(paymentDetails: PaymentDetails.defaultMock) { result in
            print(result)
        }
    }
    
    private func setupCardView() {
        cardView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(cardViewClicked(sender:)))
        cardView.addGestureRecognizer(gesture)
    }
    
    private func makeExpirationDate(s1: String?,s2: String?) -> String? {
        guard let s1 = s1 else { return ""}
        guard let s2 = s2 else { return ""}
        return s1 + "/" + s2
    }
    
    private func setupTxtFields() {
        cardNumberTxtField.delegate = self
        cardHolderTxtField.delegate = self
        cvvTxtField.delegate = self
        monthTxtField.delegate = self
        yearTxtField.delegate = self
        transactionIdTxtField.delegate = self
    }
    
    deinit {
        print("View Controller deinited")
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 0 || textField.tag == 2 {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            
            return allowedCharacters.isSuperset(of: characterSet)
        } else {
            return true
        }
        
    }
}
