//
//  ContentView.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var emailAddress: String = ""
    @State private var phoneNumber: String = ""
    @State private var gender: String = ""
    @State private var address: String = ""
    
    // TODO: move to VM
    enum Gender: String, CaseIterable, Identifiable {
        case Male, Female
        var id: Self { self }
    }

    @State private var selectedGender: Gender = .Male
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                   
                List {
                    
                    TextFieldView(title: "Full Name", inputBinding: $username)
                    TextFieldView(title: "Email Address", inputBinding: $emailAddress)
                    TextFieldView(title: "Phone Number", inputBinding: $phoneNumber)
                    TextFieldView(title: "Address (Optional)", inputBinding: $address)
                        
                    
                    Picker(selectedGender.rawValue, selection: $selectedGender) {
                        Text("Male").tag(Gender.Male)
                        Text("Female").tag(Gender.Female)
                    }
                }
//                HStack {
//                    
//                    TextFieldView(title: selectedGender.rawValue, inputBinding: $gender)
//
//                    
//                }
                
//                List {
//                }
//                .frame(height: 100)
//                List {
//                    Picker(self.gender, selection: $gender) {
//                        Text("Male")
//                        Text("Female")
//                    }
//                }

                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink("Next") {
                        FinancialInformation()
                    }
                
                }
                .padding(.top, 140)
                
            }
            .padding()
            .navigationTitle("Personal Information")
        }
    }
    
}


#Preview {
    ContentView()
}
