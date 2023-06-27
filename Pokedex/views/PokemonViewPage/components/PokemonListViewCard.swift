//
//  PokemonListViewCard.swift
//  Pokedex
//
//  Created by Harsh Soni on 23/06/23.
//

import SwiftUI

struct PokemonListViewCardUiModel {
    let pokemonElements: [PokemonElements]
    let pokemonImage: String
    let pokemonNumber: String
    let pokemonName: String
}

struct PokemonListViewCard: View {
    let uiModel: PokemonListViewCardUiModel
    
    var body: some View {
        ZStack(alignment: .trailing) {
            VStack(alignment: .leading) {
                Text("N°\(uiModel.pokemonNumber)")
                    .font(.headline)
                
                Text(uiModel.pokemonName)
                    .font(.title.bold())
                
                HStack {
                    ForEach(uiModel.pokemonElements, id: \.rawValue) { pe in
                        PokemonElementTile(pokemonElement: pe)
                    }
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            PokemonImageCard(uiModel: uiModel)
                

        }
        .background(uiModel.pokemonElements.first!.mainColor.opacity(0.2))
        .cornerRadius(24)
    }
}

struct PokemonImageCard: View {
    let uiModel: PokemonListViewCardUiModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(uiModel.pokemonElements.first!.mainColor)
            
            LinearGradient(gradient: Gradient(colors: [.white, .white.opacity(0)]), startPoint: .top, endPoint: .bottom)
                .mask(Image(uiModel.pokemonElements.first?.rawValue ?? "")
                    .resizable()
                    .scaledToFit()
                )
                .padding(.vertical, 10)
        
            AsyncImage(url: URL(string: uiModel.pokemonImage))
        }
        .frame(width: 136,height: 136)
    }
}

struct PokemonListViewCard_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListViewCard(uiModel: PokemonListViewCardUiModel(pokemonElements: [PokemonElements.electric], pokemonImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png", pokemonNumber: "0025", pokemonName: "Pikachu"))
    }
}
