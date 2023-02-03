//
//  CountryListApp.swift
//  CountryList
//
//  Created by Sigil Wen on 2023-02-02.
//

import SwiftUI

@main
struct CountryListApp: App {
    @StateObject var router = Router()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router)
                .onOpenURL{url in
                    print(url.absoluteString)
                    guard let scheme = url.scheme, scheme == "navStack" else {return}
                    guard let country = url.host else {return}
                    if let foundCountry = Country.sample.first(where: {$0.name == country}){
                        router.reset()
                        router.path.append(foundCountry)
                        if url.pathComponents.count == 2 {
                            let city = url.lastPathComponent
                            if let foundCity = foundCountry.cities.first(where: {$0.name == city}){
                                router.path.append(foundCity)
                            }
                        }
                    }
                 }
        }
    }
}
