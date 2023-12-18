//
//  CreateAccount.swift
//  VendorHub
//
//  Created by Michael Washington on 12/18/23.
//

import SwiftUI

struct CreateAccountView: View {
    @State private var storeName = ""
    @State private var storeCategory = ""
    @State private var schoolBasedAt = ""
    @State private var firstName = ""
    @State private var email = ""
    @State private var phoneNumber = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Store Information")) {
                    TextField("Store Name", text: $storeName)
                    TextField("Store Category", text: $storeCategory)
                    TextField("School Based At", text: $schoolBasedAt)
                }

                Section(header: Text("Personal Information")) {
                    TextField("Full First Name", text: $firstName)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                }

                Button(action: createAccount) {
                    Text("Create Account")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationBarTitle("Create Vendor Account", displayMode: .inline)
        }
    }

    func createAccount() {
        // Implement the account creation logic here
        // This typically involves form validation and a network request to your backend
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
