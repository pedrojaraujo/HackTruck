//
//  ContentView.swift
//  aula01
//
//  Created by Student on 31/08/23.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        VStack {
            Image("caminhao")
                .resizable()
                .scaledToFit()
            Image("caminhao")
                .resizable()
                .scaledToFit()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Text("HackTruck")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.blue)
                    .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/-53.0/*@END_MENU_TOKEN@*/)
                )
            HStack {
                Text("Maker")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/-53.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.yellow)
                    .fontWeight(.bold)
                Text("Space")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/-53.0/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.red)
                    .fontWeight(.bold)
            }
            .frame(width: 270, height: 200, alignment: .center)
            .background(.black)
            
                
        }
        .padding(.all)
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
