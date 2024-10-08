//
//  ReviewAndSubmitModel.swift
//  TSBiOSTest
//
//  Created by Joseph on 14/09/2024.
//

import Foundation

class ReviewAndSubmitModel {
    
    func getSavedDataForThisScreen() -> LoanApplicationRecord? {
        return DataStorageManager.getCurrentlySavedApplication() ?? nil
    }
    
    func getName() -> String {
        return getSavedDataForThisScreen()?.fullName ?? ""
    }
    
    func getEmail() -> String {
        return getSavedDataForThisScreen()?.emailAddress ?? ""
    }
    
    func getPhoneNumber() -> String {
        return getSavedDataForThisScreen()?.phoneNumber ?? ""
    }
    
    func getAddress() -> String? {
        guard let address = getSavedDataForThisScreen()?.address else { return nil }
        return address.isEmpty ? nil : address
    }
    
    func getGender() -> String {
        return getSavedDataForThisScreen()?.gender ?? ""
    }
    
    func getAnnualIncome() -> String {
        return getSavedDataForThisScreen()?.anualIncome ?? ""
    }
    
    func getDesiredLoanAmount() -> String {
        return getSavedDataForThisScreen()?.desiredLoanAmount ?? ""
    }
    
    func getIRDNumber() -> String {
        return getSavedDataForThisScreen()?.irdNumber ?? ""
    }
    
    func submitData() -> Bool {
        // TODO: implement a call back (make it escaping if it ever becomes an async opperation) and provide
        // TODO: user feedback ?
        return DataStorageManager.saveNewLoanApplicationToList()
    }
    
}
