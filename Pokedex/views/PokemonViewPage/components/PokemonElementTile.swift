//
//  PokemonTypeTile.swift
//  Pokedex
//
//  Created by Harsh Soni on 23/06/23.
//

import SwiftUI

struct PokemonElementTile: View {
    let pokemonElement: PokemonElements
    
    var body: some View {
        HStack {
            Circle()
                .fill(.white)
                .frame(width: 24, height: 24)
                .overlay {
                    Image(pokemonElement.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 14, height: 14)
                }
            
            Text(pokemonElement.rawValue.capitalized)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(pokemonElement.textColor)
        }
        .padding(.horizontal,12)
        .padding(.vertical, 6)
        .background(pokemonElement.mainColor)
        .cornerRadius(50)
    }
}

struct PokemonTypeTile_Previews: PreviewProvider {
    static var previews: some View {
        PokemonElementTile(pokemonElement: PokemonElements.bug)
    }
}
