//
//  SignIn.swift
//  VendorHub
//
//  Created by Michael Washington on 12/18/23.
//

import SwiftUI

struct SignIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                // Update with your app logo
                
                Text("Welcome to")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                
                Image("VH")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320, height: 120)
                    .padding()


                Spacer()

                VStack {
                    TextField("Enter Your Email", text: $email)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)

                    SecureField("Enter Your Password", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 24)
                }

                NavigationLink(destination: ForgotPassword()) {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                        .foregroundColor(Color.blue)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }

                Spacer()

                Button {
                    attemptLogin()
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 44)
                        .background(Color.blue)
                        .cornerRadius(8)
                }

                Spacer()

                Divider()
                    .background(Color.blue)

                NavigationLink(destination: CreateAccountView()) {
                    HStack {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(Color.blue)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    func attemptLogin() {
        // Placeholder login logic
        if email.isEmpty || password.isEmpty {
            alertMessage = "Please enter both email and password."
            showAlert = true
            return
        }

        // Here you can add more validation or simple logic to mimic login
        print("Attempt login with Email: \(email), Password: \(password)")

        // Set this to true if login is successful, or handle error
        // loginSuccessful = true or show error message
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
