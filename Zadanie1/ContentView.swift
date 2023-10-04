//So simple application assosiated with Dates
import SwiftUI

struct ContentView: View {
    let birthdays: [String: String] = ["Filip": "04-10-2023", "Vladyslav": "04-10-2023", "Kamil": "02-10-2015"]
    
    var body: some View {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let todayString = dateFormatter.string(from: today)
        
        let todayCelebrants = birthdays.filter { (_, value) in
            return value == todayString
        }.map { (key, _) in
            return key
        }.joined(separator: ", ")
        
        return VStack {
            
            VStack {
                Button(action: {
                    print("Przycisk działający")
                }) {
                    Text("Witam w aplikacji")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.green)
                        .multilineTextAlignment(.center)
                        .padding()
                        .border(Color.purple, width: 6)
            }
            }.padding(.top, -250)
            
            VStack {
                Text("Dzisiejsza data:")
                    .multilineTextAlignment(.leading)
            
                Text(todayString)
                    .foregroundColor(.red)
            }
            .padding()
            VStack{
                if todayCelebrants.isEmpty {
                    Text("Dziś nie ma urodzinnych obchodzących imieniny.")
                } else {
                    Text("Dzisiaj urodziny obchodzi: \(todayCelebrants)")
                }
            }.padding()
            Text("Milego dnia!")
                .foregroundColor(.green)
                .fontWeight(.bold)
                .font(.system(size: 46))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
