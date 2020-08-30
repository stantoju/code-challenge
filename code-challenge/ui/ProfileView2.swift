//
//  UpdateView.swift
//  code-challenge
//
//  Created by Toju on 29/08/2020.
//  Copyright © 2020 GTA. All rights reserved.
//

import SwiftUI

struct ProfileView2: View {
    
    @ObservedObject var vm = UserViewModel()
    @State var currentPassword = ""
    @State var newPassword = ""
    @State var confirmPassword = ""
    
    init() {
        UINavigationBar.appearance().tintColor = .darkGray
        UINavigationBar.appearance().isTranslucent = true
        vm.getProfile()
    }
    
    var body: some View {
        VStack {
            
            // Profile Form
            Form {
                Section(header: Text("BASIC INFORMATION")){
                    HStack{
                        Text("User Name")
                        TextField("Enter User Name", text: $vm.username)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack{
                        Text("First Name")
                        TextField("Enter First Name", text: $vm.firstname)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    HStack{
                        Text("Last Name")
                        TextField("Enter Last Name", text: $vm.lastname)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }.padding(.vertical,25)
            
            
            Button(action:{
                self.vm.updateProfile()
            }){
                Text("SAVE CHANGES").foregroundColor(.white)
                    .font(.system(size: 12))
            }.padding(9)
            .border(Color.white, width: 1)

            // Password Form
                    Form {
                        Section(header: Text("PASSWORD")){
                            HStack{
                                Text("Current Password")
                                SecureField("", text: $currentPassword)
                                    .multilineTextAlignment(.trailing)
                            }
                            
                            HStack{
                                Text("New Password")
                                SecureField("", text: $newPassword)
                                    .multilineTextAlignment(.trailing)
                            }
                            
                            HStack{
                                Text("Re-Enter Password")
                                Spacer()
                                SecureField("", text: $confirmPassword)
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                    }.padding(.vertical,25)
                    Button(action:{
                        self.vm.changePassword(currentPassword: self.currentPassword, newPassword: self.newPassword, confirmPassword: self.confirmPassword)
                    }){
                        Text("SAVE CHANGES").foregroundColor(.white)
                            .font(.system(size: 12))
                    }.padding(9)
                    .border(Color.white, width: 1)
            Spacer()
            
            
        }
        .background(Color("color-new"))
            .navigationBarTitle("User Profile")
        .navigationBarItems(trailing: self.vm.loading ? Spinner(): nil)
        .alert(isPresented: $vm.showAlert) {
            Alert(title: Text("Oops!"), message: Text(vm.status), dismissButton: .default(Text("OK")))
           }
    }
}

struct ProfileView2_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView2()
    }
}
