//
//  TextFieldView.swift
//  TSBiOSTest
//
//  Created by Joseph on 13/09/2024.
//

import SwiftUI

struct TextFieldView: View {
    
    var title: String
    var inputBinding: Binding<String>
    
    var body: some View {
        TextField(
               title,
               text: inputBinding
        )
//        .border(.secondary)
//        .cornerRadius(16.0)
        .padding(.top, 16)
    }
}
