//
//  SecureTextFieldView.swift
//  users
//
//  Created by Executive on 17/01/23.
//

import SwiftUI

struct SecureTextFieldView: View {
    
    @State private var isSecureField: Bool = true
    @Binding var text: String
    
    var body: some View {
        HStack {
            if isSecureField {
                SecureField("Password", text: $text)
            }
            else {
                TextField(text, text: $text)
            }
        }.overlay(alignment: .trailing) {
            Image(systemName: isSecureField ? "eye.slash" : "eye")
                .foregroundColor(.blue)
                .onTapGesture {
                    isSecureField.toggle()
                }
        }
    }
}
