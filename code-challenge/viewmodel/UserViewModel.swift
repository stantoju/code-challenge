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
        repo.getProfile(url: url) { (res, err) in
            self.loading = false
            // If Error arises from Network
            if let err = err {
                print(err.localizedDescription)
                self.status = err.localizedDescription
                self.showAlert = true
                return
            }
            
            // If Error arises from response details
            if let exception = res?.exceptionName {
                print("Babylon Exception Error", exception)
                self.status = exception
                self.showAlert = true
                return
            }
            
            if let user = res?.data {
                self.user = user
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
        
        repo.handlePost(url: url, param: param) { (res, err) in
            self.loading = false
            // If Error arises from Network
            if let err = err {
                self.status = err.localizedDescription
                self.showAlert = true
                return
            }
            
            // If Error arises from response details
            if let exception = res?.exceptionName {
                self.status = exception
                self.showAlert = true
                return
            }
            
            if let user = res?.data {
                self.user = user
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
        
        repo.handlePost(url: url, param: param) { (res, err) in
            self.loading = false
            // If Error arises from Network
            if let err = err {
                self.status = err.localizedDescription
                self.showAlert = true
                return
            }
            
            // If Error arises from response details
            if let exception = res?.exceptionName {
                self.status = exception
                self.showAlert = true
                return
            }
            
            self.status = res!.message
            self.showAlert = true
        }
    }
    
    
    
    
}
