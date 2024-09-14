//
//  ViewModel.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import Foundation
import SwiftUI

class PersonalInformationViewModel {
    
    func validateName(name: String) -> Bool {
        return name.isEmpty == false
    }
    
    func validateEmail(email: String) -> Bool {
        let regex =  "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let namePredicate = NSPredicate(format: "SELF MATCHES%@", regex)
        return namePredicate.evaluate(with: email)
    }
    
    func validatePhoneNumber(phone: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }
    
    func validateGender(gender: String) -> Bool {
        return Gender.allCases.first(where: {$0.rawValue == gender}) != nil;
    }
    
    func validateFields(name: String, email: String, phone: String, gender: String) -> String? {
        
        guard validateName(name: name) else { return "Error name cannot be empty"; }

        guard validateEmail(email: email) else { return "Error please enter a valid email"; }
        
        guard validatePhoneNumber(phone: phone) else { return "Error please enter a valid phone number"; }
        
        guard validateGender(gender: gender) else { return "Error please select a valid gender (Select any value from the picker)"; }
            
        return nil
    }
    
    func saveCurrentData(name: String, email: String, phone: String, gender: String, address: String) {
     
        var loanApplicationRecord = LoanApplicationRecord(fullName: name, emailAddress: email, phoneNumber: phone, address: address, gender: gender, anualIncome: nil, desiredLoanAmount: nil, irdNumber: nil)
        
        if let data = UserDefaults.standard.object(forKey: DataStorageManager.currentApplicationKey) as? Data,
           let currentApplication = try? JSONDecoder().decode(LoanApplicationRecord.self, from: data) {
            
            loanApplicationRecord.irdNumber = currentApplication.irdNumber ?? ""
            loanApplicationRecord.desiredLoanAmount = currentApplication.desiredLoanAmount ?? ""
            loanApplicationRecord.anualIncome = currentApplication.anualIncome ?? ""
        }
        
        if let contentData = try? JSONEncoder().encode(loanApplicationRecord) {
            UserDefaults.standard.set(contentData, forKey: DataStorageManager.currentApplicationKey)
        } else {
            print("Error saving data in the Personal Information View Model")
        }
        
    }
    
    func getSavedDataForThisScreen(username: State<String>, emailAddress: State<String>, phoneNumber: State<String>, gender: State<String>, address: State<String>) {
        
        if let data = UserDefaults.standard.object(forKey: DataStorageManager.currentApplicationKey) as? Data,
           let currentApplication = try? JSONDecoder().decode(LoanApplicationRecord.self, from: data) {
            
            username.wrappedValue = currentApplication.fullName ?? ""
            emailAddress.wrappedValue = currentApplication.emailAddress ?? ""
            phoneNumber.wrappedValue = currentApplication.phoneNumber ?? ""
            gender.wrappedValue = currentApplication.gender ?? ""
            address.wrappedValue = currentApplication.address ?? ""

        } else { // TODO: this is not right ... need to revist this logic (part of reset form logic)
            username.wrappedValue = ""
            emailAddress.wrappedValue = ""
            phoneNumber.wrappedValue = ""
            gender.wrappedValue = "Male"
            address.wrappedValue = ""
        }
        
        

    }
    
}

