//
//  FinancialInformationViewModel.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import Foundation
import SwiftUI

class FinancialInformationViewModel {
    
    // TODO: create an extension or utility methods
    // TODO: what about decimals ?
    func stringIsValidNumber(strValue: String) -> Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: strValue).isSubset(of: digitsCharacters) && strValue.isEmpty == false
    }
    
    func validateAnualIncome(anualIncome: String) -> Bool {
        return stringIsValidNumber(strValue: anualIncome)
    }
    
    func validateDesiredLoanAmountIsANumber(desiredLoanAmount: String, anualIncome: String) -> Bool {
        return stringIsValidNumber(strValue: desiredLoanAmount)
    }
    
    func validateDesiredLoanAmount(desiredLoanAmount: String, anualIncome: String) -> Bool {
        
        if let loan = Int(desiredLoanAmount), let anualIncome = Int(anualIncome) {
            return Double(loan)/Double(anualIncome) <= 0.5
        }
        
        return false
    }
    
    func validateIRDNumber(irdNumber: String) -> Bool {
        let irdNumberNoWhiteSpace = irdNumber.replacingOccurrences(of: " ", with: "")
        return stringIsValidNumber(strValue: irdNumberNoWhiteSpace) && irdNumberNoWhiteSpace.count == 9
    }
    
    func validateFields(anualIncome: String, desiredLoanAmount: String, irdNumber: String) -> String? {
        
        guard validateAnualIncome(anualIncome: anualIncome) else { return "Error: Please ensure anual income is a number!"}
        
        guard validateDesiredLoanAmountIsANumber(desiredLoanAmount: desiredLoanAmount, anualIncome: anualIncome) else { return "Error: Please ensure the desired loan amount is a number!"}
        
        guard validateDesiredLoanAmount(desiredLoanAmount: desiredLoanAmount, anualIncome: anualIncome) else { return "Error: Loan amount cannot be more than half of your annual income! "}
        
        guard validateIRDNumber(irdNumber: irdNumber) else {
            return "Error, please enter a valid 9 digit IRD number";
        }
        
        return nil;
    }
    
    
    func saveCurrentData(irdNumber: String, desiredLoanAmount: String, anualIncome: String) {
        
        if var currentApplication = DataStorageManager.getCurrentlySavedApplication() {
            
            currentApplication.irdNumber = irdNumber
            currentApplication.desiredLoanAmount = desiredLoanAmount
            currentApplication.anualIncome = anualIncome
            
            let saveSuccessfully = DataStorageManager.saveLoanApplicationInCurrentState(loanApplicationRecord: currentApplication)
            if saveSuccessfully == false { print("Error saving data in the Information View Mode") }
            
            
        } else { print("Error saving data in the Financial Information View Model, current record not found") }
       
    }
    
    func getSavedDataForThisScreen(irdNumber: State<String>, desiredLoanAmount: State<String>, anualIncome: State<String>) {
        
        if let currentApplication = DataStorageManager.getCurrentlySavedApplication() {
            
            irdNumber.wrappedValue = currentApplication.irdNumber ?? ""
            desiredLoanAmount.wrappedValue = currentApplication.desiredLoanAmount ?? ""
            anualIncome.wrappedValue = currentApplication.anualIncome ?? ""
            
        } else {
            print("Error in the Financial Information View Model, obtaining currently saved info failed")
        }
        
    }
    
}
