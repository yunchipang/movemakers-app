//
//  SignupView.swift
//  movemakers
//
//  Created by Yunchi Pang on 6/12/24.
//

import SwiftUI

struct SignupView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var showingAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("email", text: $email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                        TextField("username", text: $username)
                            .autocapitalization(.none)
                        TextField("first Name", text: $firstName)
                        TextField("last Name", text: $lastName)
                        HStack {
                            if isPasswordVisible {
                                TextField("password", text: $password)
                                    .autocapitalization(.none)
                            } else {
                                SecureField("password", text: $password)
                            }
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                
                Button("Sign Up") {
                    signUpUser()
                }
                .disabled(email.isEmpty || username.isEmpty || password.isEmpty)
                .padding()
                .foregroundColor(.white)
                .background(email.isEmpty || username.isEmpty || password.isEmpty ? Color.gray : Color.blue)
                .cornerRadius(8)
            }
            .navigationBarTitle("Sign Up", displayMode: .inline)
            .alert(isPresented: $showingAlert) { // presents alert when showingAlert is true
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func signUpUser() {
        let userData = [
            "email": email,
            "username": username,
            "first_name": firstName,
            "last_name": lastName,
            "password": password
        ]

        APIService.shared.postData(to: "http://localhost:8000/auth/signup", payload: userData) { (result: Result<User, Error>) in
            switch result {
            case .success(let user):
                print("Signup successful: \(user)")
                // handle successful signup, e.g., navigate or update UI
            case .failure(let error):
                print("Signup failed: \(error)")
                DispatchQueue.main.async {
                    ErrorHandling.parseAPIError(error) { message in
                        self.alertMessage = message
                        self.showingAlert = true
                    }
                }
            }
        }
    }

}

#Preview {
    SignupView()
}
