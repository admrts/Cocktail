//
//  CTError.swift
//  Cocktail
//
//  Created by Ali Demirtaş on 29.09.2022.
//

import Foundation


enum CTError: String, Error {
    case unableToComplete   = "Unable complete your request. Please check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}
