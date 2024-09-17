//
//  ReviewAndSubmitView.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import SwiftUI

struct ReviewAndSubmitView: View {
    
    let vm: ReviewAndSubmitModel = ReviewAndSubmitModel()

    @State private var showSuccess = false
    @Binding var path: [String]
    
    var body: some View {
        
            
            VStack(alignment: .leading) {
                Text("Please review the information you have entered and submit or else go back to edit previous fields")
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Full Name : \(self.vm.getName())")
                        
                        Text("Email : \(self.vm.getEmail())")
                        
                        Text("Phone Number : \(self.vm.getPhoneNumber())")
                        
                        if let address = vm.getAddress() {
                            Text("Address : \(address)")
                        }
                        
                        Text("Gender : \(self.vm.getGender())")
                        
                        
                        Button {
                            path.removeAll()
                        } label: {
                            Text("Edit Personal Information Section ")
                        }
                        
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text("Annual Income : \(self.vm.getAnnualIncome())")
                        
                        Text("Desired Loan Amount : \(self.vm.getDesiredLoanAmount())")
                        
                        Text("IRD Number : \(self.vm.getIRDNumber())")
                        
                        Button {
                            path.removeLast()
                        } label: {
                            Text("Edit Financial Information Section ")
                        }
                        
                    }
                    
                    if showSuccess {
                        Text("Your Application Was Successfully Submitted!")
                            .foregroundStyle(.green)
                            .padding(.top, 30)
                    }
                    
                }
                
                HStack {
                    
                    Spacer()
                                    
                    Button {
                        
                        showSuccess = self.vm.submitData()
                        delayTransition()
                        
                    } label: {
                        Text("Submit")
                    }
                    
                }
                .padding(.top, 140)
                
            }
            .navigationTitle("Review And Submit")
        
        .padding()
    }
    
    private func delayTransition() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            path.append("AllLoanApplicationsListView")
        }
    }
    
}

#Preview {
    ReviewAndSubmitView(path: .constant([]))
}
