//
//  UserViewModel.swift
//  code-challenge
//
//  Created by Toju on 27/08/2020.
//

import Foundation

final class UserViewModel: ObservableObject {
    
    var mockApi = MockAPI()
    @Published var status = ""
    @Published var loading = false
    @Published var showAlert = false
    @Published var user: User?
    @Published var firstname = ""
    @Published var lastname = ""
    @Published var username = ""
    
    
    func getProfile() {
        loading = true
        let url = Endpoint.instance.get_profile
        mockApi.getProfile(url: url) { result in

            switch result {
            case .success(let res):
                if let u = res.data {
                        self.user = u
                        self.firstname = u.firstName
                    self.username = u.userName
                        self.lastname = u.lastName
                        }
                
            case .failure(let err):
                // Network Error
                self.status = err.localizedDescription
                self.showAlert = true
            }
            
            self.loading = false
        }
        
    }
    
    
    func updateProfile() {
        loading = true
        let url = Endpoint.instance.update_profile
        let param = [
            "firstName": firstname,
        "lastName": lastname ] as [String : Any]
        
        mockApi.updateProfile(url: url, param: param) { result in
            self.loading = false
            
            switch result {
            case .success(let res):
                if let u = res.data {
                    self.user = u
                }
                
            case .failure(let err):
                // Handling Error
                self.status = self.processErrorResponse(mockError: err)
                self.showAlert = true
            }
            
        }
        
    }
    
    
    
    func changePassword(currentPassword: String, newPassword: String, confirmPassword: String) {
        loading = true
        let url = Endpoint.instance.change_password
        let param = [
        "currentPassword": currentPassword,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword ] as [String : Any]
        
        mockApi.changePassword(url: url, param: param) { result in
        self.loading = false
        
        switch result {
        case .success(let res):
            self.status = res.message
            self.showAlert = true
            
        case .failure(let err):
            // Network Error
            self.status = self.processErrorResponse(mockError: err)
            self.showAlert = true
        }
        }
    }
    
    
    
    func processErrorResponse(mockError: MockError) -> String {
        switch mockError {
            
            case .fieldRequired(let err):
                return err.message

            case .noMatch(let err):
                return err.message
        }
    }
    
    
    
    
}
