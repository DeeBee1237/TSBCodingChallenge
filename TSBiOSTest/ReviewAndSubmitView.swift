//
//  ReviewAndSubmitView.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import SwiftUI

struct ReviewAndSubmitView: View {
    
    let vm: ReviewAndSubmitModel = ReviewAndSubmitModel()
    @State private var theDataIsValid: Bool = false

    @State private var showSuccess = false
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Text("Please review the information you have entered and submit or else go back to edit previous fields")
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                VStack(spacing: 20) {
                    
                    Text("Full Name : \(self.vm.getName())")
                    
                    Text("Email : \(self.vm.getEmail())")
                    
                    Text("Phone Number : \(self.vm.getPhoneNumber())")
                    
                    if let address = vm.getAddress() {
                        Text("Address : \(address)")
                    }
                    
                    Text("Gender : \(self.vm.getGender())")
                    
                    Text("Annual Income : \(self.vm.getAnnualIncome())")
                    
                    Text("Desired Loan Amount : \(self.vm.getDesiredLoanAmount())")
                    
                    Text("IRD Number : \(self.vm.getIRDNumber())")
                    
                    
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
            .navigationDestination(isPresented: $theDataIsValid) {
                AllLoanApplicationsListView()
            }
            
        }
        .padding()
    }
    
    private func delayTransition() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            theDataIsValid = true
        }
    }
    
}

#Preview {
    ReviewAndSubmitView()
}
