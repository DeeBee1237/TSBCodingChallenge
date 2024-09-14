//
//  ReviewAndSubmitModel.swift
//  TSBiOSTest
//
//  Created by Joseph on 14/09/2024.
//

import Foundation

class ReviewAndSubmitModel {
    
    func getSavedDataForThisScreen() -> LoanApplicationRecord? {
        
        if let data = UserDefaults.standard.object(forKey: DataStorageManager.currentApplicationKey) as? Data,
           let currentApplication = try? JSONDecoder().decode(LoanApplicationRecord.self, from: data) {
            return currentApplication
        }
        
        return nil
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
    
}
