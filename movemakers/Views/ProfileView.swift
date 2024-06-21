//
//  ProfileView.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/11/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Login", destination: LoginView())
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)

                NavigationLink("Sign Up", destination: SignupView())
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .navigationTitle("Welcome")
        }
    }
}

#Preview {
    ProfileView()
}
