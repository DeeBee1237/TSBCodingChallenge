//
//  FinancialInformation.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import SwiftUI

struct FinancialInformation: View {
    
    @State private var anualIncome: String = ""
    @State private var desiredLoanAmount: String = ""
    @State private var irdNumber: String = ""
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                TextFieldView(title: "Anual Income", inputBinding: $anualIncome)
                TextFieldView(title: "Desired Loan Amount", inputBinding: $desiredLoanAmount)
                TextFieldView(title: "IRD Number", inputBinding: $irdNumber)
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink("Next") {
                        ReviewAndSubmitView()
                    }
                
                }
                .padding(.top, 140)
            }
            .padding()
            .navigationTitle("Financial Information")

        }
        
        
    }
    
}

#Preview {
    FinancialInformation()
}
