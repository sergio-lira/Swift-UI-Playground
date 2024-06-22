//
//  MyAppError.swift
//  Swift Playground
//
//  Created by Sergio Lira on 5/19/24.
//
//  Content: #localization #error #oop

import Foundation

//Exampple of Localized Error
enum MyAppError: LocalizedError {
    case invalidUsername
    case invalidPassword
    case noNetwork
    
    var errorDescription: String? {
        switch self {
        case .invalidUsername:
            "Invalid Username"
        case .invalidPassword:
            "Invalid Password"
        case .noNetwork:
            "No network connection"
        }
    }
    
    var failureReason: String {
        switch self {
        case .invalidUsername:
            "The user name entered is incorrect."
        case .invalidPassword:
            "The password is incorrect."
        case .noNetwork:
            "Unable to detect network connection."
        }
    }
}
