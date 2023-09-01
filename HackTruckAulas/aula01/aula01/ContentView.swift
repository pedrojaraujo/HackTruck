//
//  ContentView.swift
//  aula01
//
//  Created by Student on 31/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("caminhao")
                .resizable()
                .scaledToFit()
            Text("HackaTruck")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
            HStack{
                Text("Maker")
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                Text("Space")
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
