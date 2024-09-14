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
    var anualIncome: String?
    var desiredLoanAmount: String?
    var irdNumber: String?
    var dateSubmitted: Date?
    
    func getFormattedDateSubmitted() -> String {
        
        guard let date = dateSubmitted else { return "" }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter.string(from: date)
    }
}

extension LoanApplicationRecord: Identifiable {
  // IRD Number is required to submit the form so we can assume its safe
  // But, TODO: I still dont like this
    var id: String {  UUID().uuidString }
}
