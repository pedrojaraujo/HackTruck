//
//  ContentView.swift
//  BMI
//
//  Created by Student on 01/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var result: String = ""
    @State private var IMC: Double = 0
    @State private var bgColor: String = "pesoNormalColor"
    var body: some View {
        ZStack {
            Color(bgColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Calculadora de IMC")
                    .font(.largeTitle)
                Spacer()
                TextField("Digite seu peso", text: $weight)
                    .multilineTextAlignment(.center)
                    .frame(width: 370, height: 40, alignment: .center)
                    .background(.white)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 7)
                TextField("Digite sua altura", text: $height)
                    .multilineTextAlignment(.center)
                    .frame(width: 370, height: 40, alignment: .center)
                    .background(.white)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 7)
                Button("Calcular") {
                    
                    IMC = Double(weight)! / (Double(height)! * Double(height)!)
                    
                    if (IMC < 18.5) {
                        bgColor = "baixoPesoColor"
                        result = "Baixo peso"
                    } else if (IMC >= 18.5 && IMC <= 24.99) {
                        bgColor = "pesoNormalColor"
                        result = "Peso ideal"
                    } else if (IMC >= 25 && IMC <= 29.99) {
                        bgColor = "sobrepesoColor"
                        result = "Sobrepeso"
                    } else {
                        bgColor = "obesidadeColor"
                        result = "Obesidade"
                    }
                }
                .frame(width: 150.0, height: 60)
                .background(.blue)
                .font(.title2)
                .foregroundColor(.white)
                .cornerRadius(10.0)
                Spacer()
                
                Text(result)
                    .font(.largeTitle)
                    .padding(.all)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                Spacer()
                Image("tabela-IMC")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(1 / 1, contentMode: .fill)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
