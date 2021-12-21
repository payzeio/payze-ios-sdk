//
//  PaymentInfo.swift
//  PaySms
//
//  Created by Irakli Shelia on 12.12.21.
//

import Foundation

struct PaymentDetails {
    let number: String
    let cardHolder: String
    let expirationDate: String
    let securityNumber: String
    let transactionId: String
    let billingAddress: String?
    // TODO delete this
    static let mock: PaymentDetails = .init(number: "4127421007993973",
                                            cardHolder: "SALOME GELASHVILI",
                                            expirationDate: "11/22",
                                            securityNumber: "360",
                                            transactionId: "cdd3e3b5-744c-4cd7-bc2f-b4060a0d382e",
                                            billingAddress: "")
}
