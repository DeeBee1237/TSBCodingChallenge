//
//  AllLoanApplicationsListView.swift
//  TSBiOSTest
//
//  Created by Joseph on 14/09/2024.
//

import SwiftUI

struct AllLoanApplicationsListView: View {
    
    var vm: AllLoanApplicationsListViewModel = AllLoanApplicationsListViewModel()
    @Binding var path: [String]
    
    var body: some View {
        
        List {
            ForEach(vm.getAllLoanApplications()) { loanApplication in
                getLoanApplicationView(loanApplication: loanApplication)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("All Applications")
        
        Button(action : {
            self.vm.removeCurrentlySavedApplication()
            path.removeAll()
        }){
            Text("New Application")
        }
        
    }
    
    
    @ViewBuilder func getLoanApplicationView(loanApplication: LoanApplicationRecord) -> some View {
        
        if let fullName = loanApplication.fullName, let desiredAmount = loanApplication.desiredLoanAmount {
            
            VStack(alignment: .leading) {
                
                Text("Name : \(fullName)")
                Text("Desired Loan Amount : \(desiredAmount)")
                Text("Date Submitted : \(loanApplication.getFormattedDateSubmitted())")

            }
            
        } else {
           EmptyView()
        }
        
    }
    
}

#Preview {
    AllLoanApplicationsListView(path: .constant([]))
}
