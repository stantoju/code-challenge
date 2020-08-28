//
//  ChangePassView.swift
//  code-challenge
//
//  Created by Toju on 28/08/2020.
//

import SwiftUI

struct ChangePassView: View {
    
    @ObservedObject var vm = UserViewModel()
    @State var oldPassword = ""
    @State var newPassword = ""
    @State var confirmPassword = ""
    var user: User
    
    
    var body: some View {
         ZStack(alignment: .top){
                   VStack{
                       Rectangle().frame(maxWidth: .infinity, maxHeight: 200)
                       .foregroundColor(Color("color-primary"))
                       Spacer()
                   }
                   
                   VStack{
                       // Profile Image
                    Image(systemName: "lock.circle.fill").resizable()
                        .foregroundColor(.white)
                        .frame(width: 65, height: 65)
                       .shadow(radius: 10)
                       
                    Text("Change Password").bold()
                        .foregroundColor(.white)
                         .font(.system(size: 18))
                         .padding(.bottom, 70)
                         .padding(.top, 20)
                       
                       
                       
                       
                       HStack{
                               Image(systemName: "lock").frame(width: 20, height: 20)
                               .foregroundColor(Color("color-primary"))
                               Rectangle().frame(width: 1, height: 20)
                                   .foregroundColor(.white)
                                   .padding(.horizontal)
                                   .opacity(0.5)
                                   SecureField("Enter Current Pasword", text: $oldPassword)
                                       .foregroundColor(.gray)
                               Spacer()
                           }
                           .padding(15)
                           .frame(maxWidth: .infinity)
                       .background(Color(.lightGray).opacity(0.4))
                           .cornerRadius(25)
                       
                       
                       HStack{
                               Image(systemName: "lock.fill").frame(width: 20, height: 20)
                               .foregroundColor(Color("color-primary"))
                               Rectangle().frame(width: 1, height: 20)
                                   .foregroundColor(.gray)
                                   .padding(.horizontal)
                                   .opacity(0.5)
                                   SecureField("Enter New Password", text: $newPassword)
                                       .foregroundColor(.gray)
                               Spacer()
                           }
                           .padding(15)
                           .frame(maxWidth: .infinity)
                       .background(Color(.lightGray).opacity(0.4))
                           .cornerRadius(25)
                    

                    
                    HStack{
                            Image(systemName: "lock.fill").frame(width: 20, height: 20)
                            .foregroundColor(Color("color-primary"))
                            Rectangle().frame(width: 1, height: 20)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                                .opacity(0.5)
                                SecureField("Confirm New Password", text: $confirmPassword)
                                    .foregroundColor(.gray)
                            Spacer()
                        }
                        .padding(15)
                        .frame(maxWidth: .infinity)
                    .background(Color(.lightGray).opacity(0.4))
                        .cornerRadius(25)
                    
                       
                       Spacer()
                       
                       // Spinner toggles based on the loading state in the viewmodel
                       if vm.loading {
                           Spinner().padding(.leading)
                       }
                       
                        Button(action: {
                            self.vm.changePassword(currentPassword: self.oldPassword, newPassword: self.newPassword, confirmPassword: self.confirmPassword)
                        }){
                           Text("Save Changes").foregroundColor(.white).bold().layoutPriority(100)
                               .font(.system(size: 15))
                       }.padding(20)
                           .frame(maxWidth: .infinity)
                       .background(Color("color-accent"))
                       .cornerRadius(30)

                       
                       
                   }.padding(.top, 70)
                       .padding(.horizontal)
                   .padding(.bottom, 30)
                   
                   
               }.edgesIgnoringSafeArea(.all)
               .alert(isPresented: $vm.showAlert) {
                Alert(title: Text("Oops!"), message: Text(vm.status), dismissButton: .default(Text("OK")))
               }
    }
}

struct ChangePassView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePassView(user: User(firstName: "Stan", userName: "Toju", lastName: "Spyke"))
    }
}
