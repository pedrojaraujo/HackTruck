
import SwiftUI
import MapKit
import CoreLocation

struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -8.46841606913053, longitude: -55.31570446985668), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 25))

    
    struct Location: Identifiable {
        var id = UUID()
        var name: String
        var coordinate: CLLocationCoordinate2D
        var flag: URL
        var description: String
    }
    
    let locations = [
        Location(name: "Brasil", coordinate: CLLocationCoordinate2D(latitude: -8.191932216171786, longitude: -55.51016387821192), flag: URL(string: "https://www.google.com/search?q=bandeira+brasil&sca_esv=563180349&rlz=1C5CHFA_enBR1052BR1068&tbm=isch&source=iu&ictx=1&vet=1&fir=P6InSJqnJm2lIM%252CTzjPaf41h1f4MM%252C%252Fm%252F01q2pc%253B1nwX7YL923SZGM%252CTrABCPpZdobCZM%252C_%253Bjt9O7OhFUKB51M%252CFVHDpxF4IDDmvM%252C_%253B7hgvvZFmV9gGGM%252Ch5JBSWU19WtXhM%252C_%253BvJBae-qJnIiR6M%252C0A9DY1dPyxQONM%252C_&usg=AI4_-kRz-PbDIJqmjMwYmrQqb-CFExtDmw&sa=X&sqi=2&ved=2ahUKEwjS_sev7JaBAxUKq5UCHc7iBYQQ_B16BAgrEAE#imgrc=P6InSJqnJm2lIM")!,
                description: "O Brasil, um vasto país sul-americano, estende-se da Bacia Amazônica, no norte, até os vinhedos e as gigantescas Cataratas do Iguaçu, no sul. O Rio de Janeiro, simbolizado pela sua estátua de 38 metros de altura do Cristo Redentor, situada no topo do Corcovado, é famoso pelas movimentadas praias de Copacabana e Ipanema, bem como pelo imenso e animado Carnaval, com desfiles de carros alegóricos, fantasias extravagantes e samba."),
        Location(name: "Inglaterra", coordinate: CLLocationCoordinate2D(latitude: 54.98775603126325, longitude: -2.7073997539146055), flag: URL(string: "https://upload.wikimedia.org/wikipedia/en/thumb/b/be/Flag_of_England.svg/1200px-Flag_of_England.svg.png")!,
                 description: "A Inglaterra, local de nascimento de Shakespeare e dos Beatles, é um país nas ilhas britânicas que faz fronteira com a Escócia e o País de Gales. A capital, Londres, situada às margens do rio Tâmisa, abriga o Parlamento, o Big Ben e a Torre de Londres, do século XI. A cidade é também um moderno centro multicultural de artes e negócios. Outras grandes cidades são Manchester, Birmingham, Liverpool, Bristol e os centros universitários de Oxford e Cambridge."),
        Location(name: "Mexico", coordinate: CLLocationCoordinate2D(latitude: 23.984495375485913,  longitude: -102.70528646520448), flag: URL(string: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.elo7.com.br%2Fbandeira-do-mexico-tamanho-oficial-0-90x1-28m-766191%2Fdp%2F1A5E2CE&psig=AOvVaw0e4IK2cP4va9bnx_vYGWnW&ust=1694119384280000&source=images&cd=vfe&opi=89978449&ved=0CA4QjRxqFwoTCJCZjMfsloEDFQAAAAAdAAAAABAD")!,
                 description: "O México é um país situado entre os Estados Unidos e a América Central, conhecido pelas praias no Pacífico e no Golfo do México e pela paisagem diversificada que inclui montanhas, desertos e selvas. Ruínas antigas, como Teotihuacán e a cidade maia de Chichén Itzá, estão espalhadas pelo país, assim como cidades da era colonial espanhola. Na capital, Cidade do México, lojas elegantes, museus renomados e restaurantes gourmet atendem às necessidades da vida moderna."),
    
        Location(name: "Equador", coordinate: CLLocationCoordinate2D(latitude: -1.2926722868826244, longitude: -77.71641864293413), flag: URL(string: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fbr%2Fvetor%2Fbandeira-do-equador-gm1148998858-310479898&psig=AOvVaw1mC2Jt7Dr369K6McOx3QmQ&ust=1694119550417000&source=images&cd=vfe&opi=89978449&ved=0CA4QjRxqFwoTCND-iZftloEDFQAAAAAdAAAAABAD")!,
                 description: "O Equador é um país dividido pela linha do equador, situado na costa oeste da América do Sul. Sua paisagem diversificada abrange a floresta amazônica, as montanhas andinas e as Ilhas Galápagos, ricas em vida selvagem. Localizada nos contrafortes andinos e com uma elevação de 2.850 m, Quito, a capital, é conhecida por seu centro colonial espanhol quase intacto, com palácios e locais religiosos dos séculos XVI e XVII, como a ornamentada igreja Compañia de Jesús.")
    ]

    
    @State private var countries: String = "Brasil"
    @State private var showingCredits = false
    @State private var description: String = ""
    @State private var flags: URL?
    
    
    var body: some View {
        
        VStack {
            Text("World Map")
                .font(.title)
            HStack {
                Button(countries) {
                    showingCredits.toggle()
                    
                }
                .sheet(isPresented: $showingCredits) {
                    
                    //AsyncImage(url: flags)
                    
                        Text(description)
                            .presentationDetents([.medium, .large])
                            
                  
                }
            }
            
            Map(coordinateRegion: $region, annotationItems: locations) {
                estado in
                MapAnnotation( coordinate: estado.coordinate) {
                    Image(systemName: "figure.hiking" )
                        .foregroundColor(.cyan)
                }
            }
             
   
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(locations) { country in
                        Button(country.name) {
                            
                            region.center = country.coordinate
                            region.span = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 25)
                            countries = country.name
                            description = country.description
                            flags = country.flag
                            
                            
                        }
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 130, height: 30)
                        .background(.blue)
                        .cornerRadius(10)
                    }
                }
            }
            
        }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

