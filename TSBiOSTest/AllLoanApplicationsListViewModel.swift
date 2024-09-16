//
//  AllLoanApplicationsListViewModel.swift
//  TSBiOSTest
//
//  Created by Joseph on 14/09/2024.
//

import Foundation

class AllLoanApplicationsListViewModel {
    
    func getAllLoanApplications() -> [LoanApplicationRecord] {
        return DataStorageManager.getCurrentlySavedApplications()
    }
    
    func removeCurrentlySavedApplication()  {
        return DataStorageManager.removeCurrentlySavedApplication()
    }
    
    func removeLoanApplicationAtIndex(index: Int) -> Bool {
       return DataStorageManager.removeLoanApplicationAtIndex(index: index)
    }
}
