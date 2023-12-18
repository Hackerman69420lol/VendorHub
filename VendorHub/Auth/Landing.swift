//
//  Landing.swift
//  VendorHub
//
//  Created by Michael Washington on 12/18/23.
//

import SwiftUI

struct Landing: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("VH")
                    .resizable()
                    .opacity(0.3)
                
                VStack(spacing: 20) {
                    HStack {
                        Text("Welcome to Vendor")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Hub")
                            .foregroundColor(.blue)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.leading, -8.0)
                        
                    }
                    .shadow(radius: 10)
                    .padding(10)
                    
                    
                    Spacer()
                    
                    NavigationLink(destination: CreateAccountView()) {
                        Text("Create Vendor Account")
                            .font(.title2)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(40)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(destination: SignIn()) {
                        Text("Sign In")
                            .font(.title2)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.green)
                            .cornerRadius(40)
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                    Spacer()
                    
                    Divider()
                    
                    NavigationLink(destination: ForgotPassword()) {
                        Text("Forgot Password")
                    }
                }
            }
        }

    }
}

struct Landing_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
