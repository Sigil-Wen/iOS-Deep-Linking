//
//  ContentView.swift
//  CountryList
//
//  Created by Sigil Wen on 2023-02-02.
//

import SwiftUI

struct CountryView: View {
    var country: Country
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(country.flag)
                Text(country.name)
            }
            .font(.largeTitle)
            
            HStack{
                Spacer()
                Text("Population \(country.population)")
            }
            List(country.cities) { city in
                NavigationLink(value:city) {
                    Text(city.name)
                }
                
            }
            
        }
        .padding()
        .navigationTitle("Country")
        .navigationDestination(for: City.self){
            city in CityView(city: city)
        }

    }

}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            CountryView(country: Country.sample[2])
        }
    }
}
