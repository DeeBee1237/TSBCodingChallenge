//
//  FinancialInformation.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import SwiftUI

struct FinancialInformationView: View {
    
    @State private var anualIncome: String = ""
    @State private var desiredLoanAmount: String = ""
    @State private var irdNumber: String = ""
    
    @State private var dataIsValid: Bool = false
    
    @State private var errorText: String?
    var vm: FinancialInformationViewModel = FinancialInformationViewModel()

    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                TextFieldView(title: "Anual Income", inputBinding: $anualIncome)
                TextFieldView(title: "Desired Loan Amount", inputBinding: $desiredLoanAmount)
                TextFieldView(title: "IRD Number", inputBinding: $irdNumber)
                
                if let errorText {
                    Text(errorText)
                        .foregroundStyle(.red)
                        .padding(.top, 30)
                }
                
                HStack {
                    
                    Spacer()
                    
                    Button {
                        
                        self.errorText = self.vm.validateFields(anualIncome: self.anualIncome, desiredLoanAmount: self.desiredLoanAmount, irdNumber: self.irdNumber)
                        
                        dataIsValid = self.errorText == nil
                        
                    } label: {
                        Text("Next")
                    }
                
                }
                .padding(.top, 140)
            }
            .padding()
            .navigationTitle("Financial Information")
            .navigationDestination(isPresented: $dataIsValid) {
                ReviewAndSubmitView()
            }
        }
        
        
    }
    
}

#Preview {
    FinancialInformationView()
}
