//
//  DashboardView.swift
//  code-challenge
//
//  Created by Toju on 29/08/2020.
//  Copyright © 2020 GTA. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: ProfileView2()){
                    HStack{
             Text("Code Challenge View").foregroundColor(Color.white)
                                .font(.system(size: 13)).bold()
                        Spacer()
                        
                        Image(systemName: "chevron.right.2").frame(width: 20, height: 20)
                        .foregroundColor(Color.white)

                        }
                        .padding(15)
                        .frame(maxWidth: .infinity)
                        .background(Color("color-new"))
                        .cornerRadius(25)
                }
            }.padding()
            .navigationBarTitle("Dashboard")
            
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

