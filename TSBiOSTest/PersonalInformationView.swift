//
//  ContentView.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import SwiftUI

struct PersonalInformationView: View {
    
    @State private var username: String = ""
    @State private var emailAddress: String = ""
    @State private var phoneNumber: String = ""
    @State private var gender: String = ""
    @State private var address: String = ""
    
    @State private var errorText: String?
    @State private var dataIsValid: Bool = false
    
    @State private var selectedGender: Gender = .Male
    var vm : PersonalInformationViewModel = PersonalInformationViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                   
                    TextFieldView(title: "Full Name", inputBinding: $username)
                    TextFieldView(title: "Email Address", inputBinding: $emailAddress)
                    TextFieldView(title: "Phone Number", inputBinding: $phoneNumber)
                    TextFieldView(title: "Address (Optional)", inputBinding: $address)
                    
                    
                VStack {
                    
                    TextFieldView(title: "Gender", inputBinding: $gender)
                    
                    Picker(selectedGender.rawValue, selection: $selectedGender) {
                        Text("Male").tag(Gender.Male)
                        Text("Female").tag(Gender.Female)
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: selectedGender) { _, gender in
                        self.gender = gender.rawValue
                    }
                }.padding(.top, 25)
                
                
                if let errorText {
                    Text(errorText)
                        .foregroundStyle(.red)
                        .padding(.top, 30)
                }
                
                HStack {
                    
                    Spacer()
        
                    Button {
                        self.errorText = self.vm.validateFields(name: self.username, email: self.emailAddress, phone: self.phoneNumber, gender: self.gender)
                        dataIsValid = self.errorText == nil
                        
                    } label: {
                        Text("Next")
                    }
                }
                .padding(.top, 140)
                
            }
            .padding()
            .navigationTitle("Personal Information")
            .navigationDestination(isPresented: $dataIsValid) {
                FinancialInformation()
            }
        }
    }
    
}


#Preview {
    PersonalInformationView()
}
