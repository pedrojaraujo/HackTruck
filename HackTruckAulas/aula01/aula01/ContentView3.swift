import SwiftUI

struct ContentView3: View {
    @State private var showingAlert = false
    @State var name: String = ""
    var body: some View {
        ZStack {
            VStack {
                Text("Bem vindo, \(name)!")
                    .font(.title)
                    .fontWeight(.bold)
                TextField("Digite seu nome", text: $name)
                    .multilineTextAlignment(.center)
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .shadow(radius: 8)
                
                Image("truck")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                Spacer()
                Button("Entrar") {
                    showingAlert = true
                }
                .padding()
                .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("ALERTA!"),
                        message: Text("Você irá iniciar o desafio da aula agora"),
                        dismissButton: .default(Text("Vamos lá!"))
                    )
                }
            }
            .background(Image("caminhao")
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.2))
        }
        
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}

