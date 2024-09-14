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
    
}
