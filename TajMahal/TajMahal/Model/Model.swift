//
//  Model.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import Foundation
import SwiftUI

// Cette enumération répertorie 3 niveaux de piment
enum SpiceLevel {
    case light
    case medium
    case hot
}

// Représente l'objet "plat", qui figure sur la carte du menu
// Rendu identifiable pour les vues dynamiques de la liste de menu
struct Dish: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var allergens: String
    var ingredients: String
    var spiceLevel: SpiceLevel
    var imageName: String
    var price: Float
}

// Regroupe les plats en fonction du type (entrées / plats)
// Rendu identifiable pour les vues dynamiques de la liste de menu
struct Meal: Identifiable {
    let id = UUID()
    var mealType: String
    var dishs: [Dish]
}
