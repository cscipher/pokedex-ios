//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Harsh Soni on 24/06/23.
//

import Foundation

struct PokemonModel: Codable {
    var pokemonID: Int
    var pokemonName: String
    var pokemonElements: [PokemonType]
    var pokemonDescription: String?
    var weight: Int
    var height: Int
    var abilities: [PokemonAbility]
    var weakAgainstElements: [PokemonType]?
    
    enum CodingKeys: String, CodingKey {
        case pokemonID = "id"
        case pokemonName = "name"
        case pokemonElements = "types"
        case pokemonDescription
        case weight = "weight"
        case height = "height"
        case abilities = "abilities"
        case weakAgainstElements
    }
}

struct PokemonAbility: Codable {
    let ability: Ability
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

struct Ability: Codable {
    let name: String
    let url: String
}

struct PokemonType: Codable {
    let slot: Int
    let type: TypeClass
}

struct TypeClass: Codable {
    let name: String
    let url: String
}

struct PokemonInfoModel : Codable {
    let results: [PokemonInfoResultModel]
}

struct PokemonInfoResultModel: Codable {
    var name: String
    var url: String
}
