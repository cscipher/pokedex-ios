//
//  PokemonFilterToolbar.swift
//  Pokedex
//
//  Created by Harsh Soni on 23/06/23.
//

import SwiftUI

struct PokemonFilterToolbar: View {
    
    let pokemonTypeColor: Color
    
    var body: some View {
        HStack {
            HStack {
                Text("Filter")
                    .font(.system(size: 20, weight: .medium))
                Spacer()
                Image(systemName: "chevron.down")
            }
            .padding(.all, 20)
            .background(pokemonTypeColor)
            .cornerRadius(50)
            
            HStack {
                Text("Filter")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.white)
            }
            .padding(.all, 20)
            .background(Color.accentColor)
            .cornerRadius(50)
        }
    }
}

struct PokemonFilterToolbar_Previews: PreviewProvider {
    static var previews: some View {
        PokemonFilterToolbar(pokemonTypeColor: .red)
    }
}
