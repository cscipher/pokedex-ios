//
//  PokemonListView.swift
//  Pokedex
//
//  Created by Harsh Soni on 23/06/23.
//

import SwiftUI

struct PokemonListView: View {
    @State var pokemonModels: [PokemonModel]?
    
    init(pokemonModels: [PokemonModel]? = nil) {
        self.pokemonModels = pokemonModels
        Task {
            await testCall()
        }
    }
    
    
    func _getPokemonImage(id: Int) -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/\(id).png";
    }
    
    func _mapPokeElements(_ pokeTypes: [PokemonType]) -> [PokemonElements] {
        var typecastedEnums: [PokemonElements] = []
        for pt in pokeTypes {
            typecastedEnums.append(PokemonElements(rawValue: pt.type.name) ?? PokemonElements.normal)
        }
        return typecastedEnums
    }
    
    func _getUiModelFromPokemon(_ pokemon: PokemonModel) -> PokemonListViewCardUiModel {
        return PokemonListViewCardUiModel(
            pokemonElements: _mapPokeElements(pokemon.pokemonElements),
            pokemonImage: _getPokemonImage(id: pokemon.pokemonID),
            pokemonNumber: String(pokemon.pokemonID),
            pokemonName: pokemon.pokemonName
        )
    }
    
    mutating func testCall() async {
        pokemonModels = await PokemonApiService().fetchPokemonDetails(limit: 5)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(pokemonModels!, id:\.pokemonID) { pokemon in
                    PokemonListViewCard(uiModel: _getUiModelFromPokemon(pokemon))
                }
            }
        }
    }
}


struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
