//
//  LoanApplicationRecord.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import Foundation

struct LoanApplicationRecord: Codable {
    
    let fullName: String?
    let emailAddress: String?
    let phoneNumber: String?
    let address: String?
    let gender: String?
    let anualIncome: String?
    let desiredLoanAmount: String?
    let irdNumber: String?
    
}
