//
//  Spinner.swift
//  code-challenge
//
//  Created by Toju on 28/08/2020.
//  Copyright © 2020 GTA. All rights reserved.
//

import SwiftUI

struct Spinner: View {
    @State var animate = false
    var body: some View {
        
        VStack {
            Circle()
                .trim( from: 0, to: 0.8)
                .stroke(AngularGradient(gradient: .init(colors: [Color(.white), Color("color-accent")]), center: .center), style: StrokeStyle(lineWidth: 4, lineCap: .round))
            .frame(width: 20, height: 20)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
                    }
    .padding(5)
//        .background(Color.white)
    .cornerRadius(10)
        .onAppear {
            self.animate.toggle()
            
        }
    }
}

struct Spinner_Previews: PreviewProvider {
    static var previews: some View {
        Spinner()
    }
}
