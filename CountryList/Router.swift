//
//  Router.swift
//  CountryList
//
//  Created by Sigil Wen on 2023-02-02.
//

import Foundation
import SwiftUI

class Router: ObservableObject{
    @Published var path = NavigationPath()
    
    func reset(){
        path = NavigationPath()
    }
}
