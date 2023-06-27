//
//  PokemonSearchBar.swift
//  Pokedex
//
//  Created by Harsh Soni on 23/06/23.
//

import SwiftUI

struct PokemonSearchBar: View {
    @State private var searchQuery = ""
    @FocusState private var searchFieldFocusState: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 24))
                .foregroundColor(searchFieldFocusState ? .black : .gray.opacity(0.5))
                
            
            TextField("Search Pokémon...", text: $searchQuery)
                .disableAutocorrection(true)
                .font(.title2)
                .focused($searchFieldFocusState)
                
        }
        .onAppear {
            searchFieldFocusState = false
        }
        .padding(.all, 14)
        .overlay(RoundedRectangle(cornerRadius: 50).stroke(searchFieldFocusState ? .black : .gray, lineWidth: searchFieldFocusState ? 3 : 1))
            
            
    }
}

struct PokemonSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        PokemonSearchBar()
    }
}
