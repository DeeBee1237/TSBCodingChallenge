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
    
    @State var refresh: Bool = false
    
    var body: some View {
        
        // TODO: this is such a hack, but as of now I'm not really sure how else
        // TODO: to get the view to refresh when t
        if refresh || !refresh {
            List {
                ForEach(Array(vm.getAllLoanApplications().enumerated()), id: \.offset) { index, loanApplication in
                    getLoanApplicationView(loanApplication: loanApplication, index: index)
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
        
    }
    
    
    @ViewBuilder func getLoanApplicationView(loanApplication: LoanApplicationRecord, index: Int) -> some View {
        
        if let fullName = loanApplication.fullName, let desiredAmount = loanApplication.desiredLoanAmount {
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    Text("Name : \(fullName)")
                    Text("Desired Loan Amount : \(desiredAmount)")
                    Text("Date Submitted : \(loanApplication.getFormattedDateSubmitted())")
                    
                }
                
                Button {
                    let removed = self.vm.removeLoanApplicationAtIndex(index: index)
                    if removed == false {
                        // TODO: maybe show some kind of toast message here if anything ...
                    } else {
                        refresh.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                }
                .frame(width: 10, height: 10)
                
            }
            
        } else {
           EmptyView()
        }
        
    }
    
}

#Preview {
    AllLoanApplicationsListView(path: .constant([]))
}
