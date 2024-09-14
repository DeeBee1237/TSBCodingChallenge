//
//  AllLoanApplicationsListView.swift
//  TSBiOSTest
//
//  Created by Joseph on 14/09/2024.
//

import SwiftUI

struct AllLoanApplicationsListView: View {
    
    // https://stackoverflow.com/questions/61930915/swiftui-detecting-the-navigationview-back-button-press
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var vm: AllLoanApplicationsListViewModel = AllLoanApplicationsListViewModel()
    
    var body: some View {
        
        List {
            ForEach(vm.getAllLoanApplications()) { loanApplication in
                getLoanApplicationView(loanApplication: loanApplication)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.vm.removeCurrentlySavedApplication()
            self.mode.wrappedValue.dismiss()
        }){
            Text("New Application")
        })
        
    }
    
    
    @ViewBuilder func getLoanApplicationView(loanApplication: LoanApplicationRecord) -> some View {
        
        if let fullName = loanApplication.fullName, let desiredAmount = loanApplication.desiredLoanAmount {
            
            VStack {
                
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
    AllLoanApplicationsListView()
}
