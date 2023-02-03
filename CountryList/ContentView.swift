//
//  ContentView.swift
//  CountryList
//
//  Created by Sigil Wen on 2023-02-02.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        NavigationStack(path: $router.path){
            List(Country.sample) { country in
                NavigationLink(value: country) {
                    HStack{
                        Text(country.flag)
                        Text(country.name)
                    }
                }
            }
            .navigationDestination(for: Country.self) {country in
                CountryView(country: country)
                
            }
            .navigationTitle("Countries")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Router())
    }
}
