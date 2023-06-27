//
//  PokemonElements.swift
//  Pokedex
//
//  Created by Harsh Soni on 23/06/23.
//

import Foundation
import SwiftUI


enum PokemonElements: String {
    case fire
    case water
    case dragon
    case electric
    case fairy
    case ghost
    case grass
    case bug
    case fighting
    case normal
    case dark
    case steel
    case rock
    case psychic
    case ground
    case poison
    case ice
    case flying
    
    var mainColor: Color {
        switch(self) {
        case .fire:
            return Color(hex: 0xFF9D55)
        case .water:
            return Color(hex: 0x5090D6)
        case .dragon:
            return Color(hex: 0x0B6DC3)
        case .electric:
            return Color(hex: 0xF4D23C)
        case .fairy:
            return Color(hex: 0xEC8FE6)
        case .ghost:
            return Color(hex: 0x5269AD)
        case .grass:
            return Color(hex: 0x63BC5A)
        case .bug:
            return Color(hex: 0x91C12F)
        case .fighting:
            return Color(hex: 0xCE416B)
        case .normal:
            return Color(hex: 0x919AA2)
        case .dark:
            return Color(hex: 0x5A5465)
        case .steel:
            return Color(hex: 0x5A8EA2)
        case .rock:
            return Color(hex: 0xC5B78C)
        case .psychic:
            return Color(hex: 0xFA7179)
        case .ground:
            return Color(hex: 0xD97845)
        case .poison:
            return Color(hex: 0xB567CE)
        case .ice:
            return Color(hex: 0x73CEC0)
        case .flying:
            return Color(hex: 0x89AAE3)
        }
    }
    
    var textColor: Color {
        switch(self) {
            case .dark, .fighting, .ghost, .dragon : return .white
            default: return .black
        }
    }
}

