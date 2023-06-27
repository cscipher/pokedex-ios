//
//  PokemonViewPage.swift
//  Pokedex
//
//  Created by Harsh Soni on 23/06/23.
//

import SwiftUI

struct PokemonViewPage: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(AssetConstants.pokeball)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 40,height: 40)
                    .foregroundColor(.accentColor)
                
                Text("Pokédex")
                    .font(.system(size: 30, weight: .semibold))
                Spacer()
            }
            .padding(.all, 16)
            
            PokemonSearchBar()
                .padding(.vertical, 20)
                .padding(.horizontal, 16)
            
            Divider()
            
            PokemonFilterToolbar(pokemonTypeColor: .red) // TODO: update it from model
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
            
            PokemonListView()
            
            Spacer()
        }
    }
}

struct PokemonViewPage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonViewPage()
    }
}
