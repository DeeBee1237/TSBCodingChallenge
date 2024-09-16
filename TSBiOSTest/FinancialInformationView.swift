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
        
    @State private var errorText: String?
    var vm: FinancialInformationViewModel = FinancialInformationViewModel()

    @Binding var path: [String]
    
    var body: some View {
                    
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
                        
                        if self.errorText == nil {
                            self.vm.saveCurrentData(irdNumber: self.irdNumber, desiredLoanAmount: self.desiredLoanAmount, anualIncome: self.anualIncome)
                            path.append("ReviewAndSubmitView")
                        }
                        
                    } label: {
                        Text("Next")
                    }
                
                }
                .padding(.top, 140)
            }
            .padding()
            .navigationTitle("Financial Information")
            .onAppear {
                self.vm.getSavedDataForThisScreen(irdNumber: self._irdNumber, desiredLoanAmount: self._desiredLoanAmount, anualIncome: self._anualIncome)
            }
    }
    
}

#Preview {
    FinancialInformationView(path:.constant([]))
}
