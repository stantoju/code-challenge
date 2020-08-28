//
//  UserViewModel.swift
//  code-challenge
//
//  Created by Toju on 27/08/2020.
//

import Foundation

final class UserViewModel: ObservableObject {
    
    var repo = UserRepo()
    @Published var status = ""
    @Published var loading = false
    @Published var showAlert = false
    var user = User(firstName: "Johnny B", userName: "iOS User", lastName: "Goode")
    
    func getProfile() {
        loading = true
        let url = Endpoint.instance.get_profile
        repo.getProfile(url: url) { result in
            self.loading = false

            switch result {
            case .success(let res):
                // Exception errors from server
                if let exeption = res.exceptionName {
                    self.status = "Server error: \(exeption)"
                    self.showAlert = true
                }
                
                if let u = res.data {
                    self.user = u
                }
                
            case .failure(let err):
                // Network Error
                self.status = err.localizedDescription
                self.showAlert = true
            }
        }
    }
    
    
    func updateProfile(firstName: String, lastName: String) {
        if firstName.isEmpty || lastName.isEmpty {
            self.status = "All fields are required"
            self.showAlert = true
            return
        }
        loading = true
        let url = Endpoint.instance.update_profile
        let param = [
        "firstName": firstName,
        "lastName": lastName ] as [String : Any]
        
        repo.handlePost(url: url, param: param) { result in
            self.loading = false
            
            switch result {
            case .success(let res):
                // Exception errors from server
                if let exeption = res.exceptionName {
                    self.status = "Server error: \(exeption)"
                    self.showAlert = true
                }
                
                if let u = res.data {
                    self.user = u
                }
                
            case .failure(let err):
                // Network Error
                self.status = err.localizedDescription
                self.showAlert = true
            }
            
        }
    }
    
    
    
    
    func changePassword(currentPassword: String, newPassword: String, confirmPassword: String) {
        if currentPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty {
            self.status = "All fields are required"
            self.showAlert = true
            return
        }
        if newPassword != confirmPassword {
            self.status = "New passpwed an confirmation passwords do not match"
            self.showAlert = true
            return
        }
        
        loading = true
        let url = Endpoint.instance.change_password
        let param = [
        "currentPassword": currentPassword,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword ] as [String : Any]
        
        repo.handlePost(url: url, param: param) { result in
        self.loading = false
        
        switch result {
        case .success(let res):
            // Exception errors from server
            if let exeption = res.exceptionName {
                self.status = "Server error: \(exeption)"
                self.showAlert = true
            }
            
            if let u = res.data {
                self.user = u
            }
            
        case .failure(let err):
            // Network Error
            self.status = err.localizedDescription
            self.showAlert = true
        }
        }
    }
    
    
    
    
}
