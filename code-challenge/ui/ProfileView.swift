//
//  ProfileView.swift
//  code-challenge
//
//  Created by Toju on 28/08/2020.
//

import SwiftUI


struct ProfileView: View {
    
    @ObservedObject var vm = UserViewModel()
    @State var passwordSheet = false
    
    init() {
        vm.getProfile()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    // Loader view toggle depending network call
                    if vm.loading {
                    HStack{
                        Spacer()
                        Spinner()
                    }.padding()
                    }
                    
                    // Profile Image
                    Image("sparrow").resizable().frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .overlay(Circle()
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color("color-primary"), Color("color-accent")]), startPoint: .top, endPoint: .bottom), lineWidth: 3))
                        .padding(.vertical, 30)
                    
                    
                    // Name and Username
                    Text("\(vm.user.firstName) \(vm.user.lastName)").font(.system(size: 20)).bold()
                    Text(vm.user.userName).font(.subheadline)
                    .foregroundColor(Color("color-primary"))
                    
                    
                    Divider().padding(.vertical, 20)
                    
                    VStack(alignment: .center, spacing: 7) {
                        
                        // Edit Button triggers navigationview
                        NavigationLink(destination: EditProfileView(user: self.vm.user)){
                            HStack{
                                    Image(systemName: "person.fill").frame(width: 20, height: 20)
                                    .foregroundColor(Color.white)
                                Rectangle().frame(width: 1, height: 20)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .opacity(0.5)
                                    Text("Edit Profile").foregroundColor(Color.white)
                                        .font(.system(size: 13)).bold()
                                Spacer()
                                }
                                .padding(15)
                                .frame(maxWidth: .infinity)
                                .background(Color("color-primary"))
                                .cornerRadius(25)
                        }
                        

                        // Chane Password Button triggers bottomsheet
                            HStack{
                                Image(systemName: "lock.fill").frame(width: 20, height: 20)
                                .foregroundColor(Color.white)
                                Rectangle().frame(width: 1, height: 20)
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                                    .opacity(0.5)
                                    Text("Change Password").foregroundColor(Color.white)
                                 .font(.system(size: 13)).bold()
                                Spacer()
                            }
                            .padding(15)
                            .frame(maxWidth: .infinity)
                            .background(Color("color-accent"))
                            .cornerRadius(25)
                            .onTapGesture {
                                self.passwordSheet = true
                        }
                        
                    }.padding(20)
                    

                }
                .frame(width: UIScreen.main.bounds.width - 50)
                .background(Color(.white).opacity(0.8))
                .cornerRadius(30)
                .padding(50)
                .padding(.top, 70)
                
            }
                .navigationBarTitle("")
            .edgesIgnoringSafeArea(.all)
            .background(Image("busy_bg").resizable().scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .opacity(0.4))
            
        }
        .alert(isPresented: $vm.showAlert) {
            Alert(title: Text("Oops!"), message: Text(vm.status), dismissButton: .default(Text("OK")))
           }
        .sheet(isPresented: $passwordSheet){
            ChangePassView(user: self.vm.user)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
