//
//  Cocktail.swift
//  Cocktail
//
//  Created by Ali Demirtaş on 29.09.2022.
//

import Foundation

struct Cocktail: Codable,Hashable {
    let drinks: [Drinks]
}


struct Drinks: Codable,Hashable {
    
    let strDrink: String
    
    let strDrinkThumb: String
    
}
