//
//  DataStorageManager.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import Foundation

class DataStorageManager {
    
    static let currentApplicationKey : String = "currentLoanApplication"
    
    static let allApplicationsKey : String = "allLoanApplications"

    
    
    static func getCurrentlySavedApplication() -> LoanApplicationRecord? {
        
        if let data = UserDefaults.standard.object(forKey: DataStorageManager.currentApplicationKey) as? Data,
           let currentApplication = try? JSONDecoder().decode(LoanApplicationRecord.self, from: data) {
            
            return currentApplication
            
        }
        
        return nil
    }
    
    static func removeCurrentlySavedApplication() {
        UserDefaults.standard.removeObject(forKey: DataStorageManager.currentApplicationKey)
    }
    
    static func getCurrentlySavedApplications() -> [LoanApplicationRecord] {
        
        if let data = UserDefaults.standard.object(forKey: DataStorageManager.allApplicationsKey) as? Data,
           let currentApplications = try? JSONDecoder().decode([LoanApplicationRecord].self, from: data) {
            return currentApplications
        }
        
        return [] // return empty list if none are found
    }
    
    static func saveNewApplicationListState(applications: [LoanApplicationRecord]) -> Bool {
        
        do {

            let encodedData = try JSONEncoder().encode(applications)
            UserDefaults.standard.set(encodedData, forKey: allApplicationsKey)
            return true
            
        } catch {
            // Maybe do a Firebase console log instead ;)
            print("ERROR saving data in saveNewApplicationListState")
            return false
        }
        
    }
    
    
    static func saveNewLoanApplicationToList() -> Bool {
     
        guard var savedApplication = getCurrentlySavedApplication() else {
            print("Error! For some reason the current application has not been saved properly!")
            return false
        }
        
        savedApplication.dateSubmitted = Date()
        
        var applications: [LoanApplicationRecord] = getCurrentlySavedApplications()
        applications.append(savedApplication)
        
        return saveNewApplicationListState(applications: applications)
        
    }
    
    static func saveLoanApplicationInCurrentState(loanApplicationRecord: LoanApplicationRecord) -> Bool {
        
        if let contentData = try? JSONEncoder().encode(loanApplicationRecord) {
            UserDefaults.standard.set(contentData, forKey: DataStorageManager.currentApplicationKey)
            return true
        }
        
        return false
    }
    
    
    static func removeLoanApplicationAtIndex(index: Int) -> Bool {
     
        var applications: [LoanApplicationRecord] = getCurrentlySavedApplications()
        applications.remove(at: index)
        
        return saveNewApplicationListState(applications: applications)
        
    }
}
