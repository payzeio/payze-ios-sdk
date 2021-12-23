//
//  PaymentInfo.swift
//  PaySms
//
//  Created by Irakli Shelia on 12.12.21.
//

import Foundation

struct PaymentDetails {
    var number: String = ""
    var cardHolder: String = ""
    var expirationDate: String = ""
    var securityNumber: String = ""
    var transactionId: String = ""
    var billingAddress: String? = ""
    static let defaultBillingAddress: String = ""
    // TODO delete this
    
    static let mock: PaymentDetails! = .init(number: "4127421007993973",
                                             cardHolder: "SALOME GELASHVILI",
                                             expirationDate: "11/22",
                                             securityNumber: "360",
                                             transactionId: "cdd3e3b5-744c-4cd7-bc2f-b4060a0d382e",
                                             
                                             billingAddress: "")!
    
    init?(number: String?,cardHolder: String?,expirationDate: String?,securityNumber: String?,transactionId: String?, billingAddress: String?) {
        
        guard let number = number else { return nil }
        guard let cardHolder = cardHolder else { return nil }
        guard let expirationDate = expirationDate else { return nil }
        guard let securityNumber = securityNumber else { return nil }
        guard let transactionId = transactionId else { return nil }
        
        self.number = number
        self.cardHolder = cardHolder
        self.expirationDate = expirationDate
        self.securityNumber = securityNumber
        self.transactionId = transactionId
        self.billingAddress = billingAddress
        
    }
    
}


