//
//  ContentView.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""

    
    var body: some View {
        
        VStack {
            
            inputField("Full Name", $username)
            
        }
        .padding()
    }
    
    
    
    
    @ViewBuilder func inputField(_ title: String, _ inputBinding: Binding<String>) -> some View {
        
        TextField(
               title,
               text: inputBinding
        )
        .border(.secondary)
        .cornerRadius(4.0)
    }
    
}

#Preview {
    ContentView()
}
