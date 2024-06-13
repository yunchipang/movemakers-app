//
//  LoginView.swift
//  movemakers
//
//  Created by Yunchi Pang on 6/12/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        Form {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button("Login") {
                // Implement login functionality here
                print("Login attempt for \(email)")
            }
            .disabled(email.isEmpty || password.isEmpty)
        }
        .navigationTitle("Login")
    }
}

#Preview {
    LoginView()
}
