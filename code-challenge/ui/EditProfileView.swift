//
//  EditProfileView.swift
//  code-challenge
//
//  Created by Toju on 28/08/2020.
//

import SwiftUI

struct EditProfileView: View {
    
    @ObservedObject var vm = UserViewModel()
    @State var firstname = ""
    @State var lastname = ""
    var user: User
    
    var body: some View {
        ZStack(alignment: .top){
            VStack{
                Rectangle().frame(maxWidth: .infinity, maxHeight: 150)
                .foregroundColor(Color("color-primary"))
                Spacer()
            }
            
            VStack{
                // Profile Image
                Image("sparrow").resizable().frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle()
                    .stroke(Color.white, lineWidth: 3))
                    .padding(.top, 30)
                
                Text(user.userName).bold().font(.system(size: 13))
                    .padding(.bottom, 30)
                
                
                
                
                HStack{
                        Image(systemName: "person.fill").frame(width: 20, height: 20)
                        .foregroundColor(Color("color-primary"))
                        Rectangle().frame(width: 1, height: 20)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .opacity(0.5)
                            TextField("Enter First Name", text: $firstname)
                                .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(15)
                    .frame(maxWidth: .infinity)
                .background(Color(.lightGray).opacity(0.4))
                    .cornerRadius(25)
                
                
                HStack{
                        Image(systemName: "person.fill").frame(width: 20, height: 20)
                        .foregroundColor(Color("color-primary"))
                        Rectangle().frame(width: 1, height: 20)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .opacity(0.5)
                            TextField("Enter Lasr Name", text: $lastname)
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
                    self.vm.updateProfile(firstName: self.firstname, lastName: self.lastname)
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
        }.onAppear{
            self.firstname = self.user.firstName
            self.lastname = self.user.lastName
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User(firstName: "Stan", userName: "Toju", lastName: "Spyke"))
    }
}

