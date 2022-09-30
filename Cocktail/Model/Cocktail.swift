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
    
    let strInstructions: String
    
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
}
