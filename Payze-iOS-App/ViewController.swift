//
//  ViewController.swift
//  Payze-iOS-App
//
//  Created by Irakli Shelia on 20.12.21.
//

import UIKit

class ViewController: UIViewController {

    private let myService = PaymentService()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }

    @IBAction func sendCardDetails() {
        view.backgroundColor = .green
        self.myService.startPayment(paymentDetails: PaymentDetails.mock) { result in
            print(result)
        }
    }

    deinit {
        print("View Controller deinited")
    }
}
