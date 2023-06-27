//
//  ContentView.swift
//  Pokedex
//
//  Created by Harsh Soni on 23/06/23.
//

import SwiftUI

struct PokeDashboard: View {
    @State private var selectedTabIndex = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            PokemonViewPage()
                .tabItem {
                    Image(selectedTabIndex == 0 ? AssetConstants.pokeballNavSelected : AssetConstants.pokeballNavUnselected)
                        .font(.title)
                    Text("Poke List")
                }
                .tag(0)
            
            FavouriteViewPage()
                .tabItem {
                    Image(selectedTabIndex == 1 ? AssetConstants.favouriteNavSelected : AssetConstants.favouriteNavUnselected)
                    Text("Favourites")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokeDashboard()
    }
}
