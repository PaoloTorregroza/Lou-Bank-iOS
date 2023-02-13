//
//  AuthViewModel.swift
//  LouBank
//
//  Created by Paolo Torregrosa on 12/02/23.
//

class AuthViewModel {
    private let passCode = "25800"
    var currentPassCode = ""
    
    func validatePassCode() -> Bool {
        return currentPassCode == passCode
    }
    
    func deletePassCode() {
        currentPassCode = ""
    }
    
    func passCodeKeyPressed(_ key: String) {
        if currentPassCode.count <= 5 {
            currentPassCode.append(key)
        }
    }
}
