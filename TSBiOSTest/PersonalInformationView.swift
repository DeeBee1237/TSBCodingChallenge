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
    @State private var selectedGender: Gender = .Male
    @State private var gender: String = "Male"
    @State private var address: String = ""
    @State private var errorText: String?
    
    var vm : PersonalInformationViewModel = PersonalInformationViewModel()
    
    @State private var path: [String] = []
    
    @State private var pickerIsShowing: Bool = false
    
    var body: some View {
        
        NavigationStack(path: $path) {
            
            VStack {
                   
                    TextFieldView(title: "Full Name", inputBinding: $username)
                    TextFieldView(title: "Email Address", inputBinding: $emailAddress)
                    TextFieldView(title: "Phone Number", inputBinding: $phoneNumber)
                    TextFieldView(title: "Address (Optional)", inputBinding: $address)
                    
                    
                VStack {
                    
                    TextFieldView(title: "Gender", inputBinding: $gender)
                        .onTapGesture {
                            pickerIsShowing = true
                        }
                    
                    if pickerIsShowing {
                        Picker(selectedGender.rawValue, selection: $selectedGender) {
                            Text("Male").tag(Gender.Male)
                            Text("Female").tag(Gender.Female)
                        }
                        .pickerStyle(.segmented)
                        .onChange(of: selectedGender) { _, gender in
                            self.gender = gender.rawValue
                        }
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
                        
                        if self.errorText == nil {
                            
                            self.vm.saveCurrentData(name: self.username, email: self.emailAddress, phone: self.phoneNumber, gender: self.gender, address: self.address)
                            self.path.append("FinancialInformationView")
                            
                        }
                        
                    } label: {
                        Text("Next")
                    }
                }
                .padding(.top, 140)
                
            }
            .onAppear {
                self.vm.getSavedDataForThisScreen(username: _username, emailAddress: _emailAddress, phoneNumber: _phoneNumber, gender: _gender, address: _address)
                // TODO: this needs to be fixed with a get set approach or someother way to avoid
                // setting both individually
                self.selectedGender = Gender(rawValue: self.gender) ?? .Male
            }
            .padding()
            .navigationTitle("Personal Information")
            .navigationDestination(for: String.self) { pathValue in
                if pathValue == "FinancialInformationView" {
                    FinancialInformationView(path: $path)
                } else if pathValue == "ReviewAndSubmitView" {
                    ReviewAndSubmitView(path: $path)
                }
                else if pathValue == "AllLoanApplicationsListView" {
                    AllLoanApplicationsListView(path: $path)
                }
            }
        }
    }
    
}


#Preview {
    PersonalInformationView()
}
