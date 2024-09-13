//
//  ViewModel.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import Foundation


class PersonalInformationViewModel {
    
    
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
    
    func validateFields(email: String, phone: String) -> String? {
        
        guard validateEmail(email: email) else { return "Error please enter a valid email"; }
        
        guard validatePhoneNumber(phone: phone) else { return "Error please enter a valid phone number"; }
        
        return nil
    }
    
}

