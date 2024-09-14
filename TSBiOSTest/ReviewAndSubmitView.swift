//
//  ReviewAndSubmitView.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import SwiftUI

struct ReviewAndSubmitView: View {
    
    let vm: ReviewAndSubmitModel = ReviewAndSubmitModel()
    
    var body: some View {
        
        NavigationStack {
            
            Text("Please review the information you have entered and submit or else go back to edit previous fields")

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
                
            }
            
            HStack {
                
                Spacer()
    
                Button {
                   // TODO: implement save logic here
                } label: {
                    Text("Submit")
                }
            }
            .padding(.top, 140)
            
        }
        .padding()
        .navigationTitle("Review And Submit")
    }
    
}

#Preview {
    ReviewAndSubmitView()
}
