//
//  ContentView.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var username: String = ""
    @State private var username: String = ""

    
    var body: some View {
        
        VStack {
            
            TextField(
                   "Full Name",
                   text: $username
            )
            .border(.black)
            .cornerRadius(2)
            
            TextField(
                   "Full Name",
                   text: $email
            )
            
            TextField(
                   "Full Name",
                   text: $username
            )
            
            TextField(
                   "Full Name",
                   text: $username
            )
            
        }
        .padding()
    }
    
    
    
    
    @ViewBuilder func inputField(inputBinding: Binding<String>) -> some View {
        
        TextField(
               "Full Name",
               text: input
        )
    }
    
}

#Preview {
    ContentView()
}
