//  ContentView.swift
//  Swift Playground
//
//  Created by Sergio Lira on 5/19/24.
//
// C ontent: #alerts #error

import SwiftUI
import SwiftData

struct Alerts: View {
    @State private var isShowingBasicAlert = false
    @State private var isShowingEnterValueAlert = false
    @State private var isShowingLogInAlert = false
    @State private var error: MyAppError = .noNetwork
    
    @State private var valueString = ""
    
    var body: some View {
        VStack(spacing: 40) {
            
            // Basic alert that also uses buttons with roles to change look
            Button("Fetch Data"){
                isShowingBasicAlert = true
            }
            .alert("No Network", isPresented: $isShowingBasicAlert) {
                Button("Try again") {
                    // Try again code
                }
                
                Button("Delete", role: .destructive) {
                    // Do delete code
                }
                
                Button("Cancel", role: .cancel) {
                    // do Cancel
                }
                
            } message: {
                Text("No Network detected. Connect to wifi and try again.")
            }

            // Alert that allows to enter data
            Button("Enter Data"){
                isShowingEnterValueAlert = true
            }
            .alert("Enter Value", isPresented: $isShowingEnterValueAlert) {
                TextField("Value", text: $valueString)
                Button("Sumit") {
                    //code
                }
                Button("Cancel", role: .cancel)
                {
                    //code
                }
            } message: {
                Text("Enter the dollar value of your item.")
            }

            //Alert that uses an error and cases to dynamically change the UI
            Button("Log In"){
                isShowingLogInAlert = true
                error = .invalidUsername
            }
            .alert(isPresented: $isShowingLogInAlert, error: error) { error in
                if error == .invalidUsername {
                    TextField("UserName", text: $valueString)
                    
                    Button("Submit") {
                        
                    }
                    
                    Button("Cancel", role:.cancel) {
                        
                    }
                }
            } message: { error in
                Text(error.failureReason)
            }

        }
    }
}

#Preview {
    Alerts()
}
