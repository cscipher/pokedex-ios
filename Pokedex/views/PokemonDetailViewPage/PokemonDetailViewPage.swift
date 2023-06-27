//
//  PokemonDetailViewPage.swift
//  Pokedex
//
//  Created by Harsh Soni on 23/06/23.
//

import SwiftUI

struct PokemonDetailViewPageUiModel {
    let pokemonElements: [PokemonElements]
    let pokemonName: String
    let pokemonImage: String
    let pokemonNumber: String
    let pokemonDescription: String
    let weightOfPokemonInKG: Double
    let heightOfPokemonInM: Double
    let ability: String
    let weaknesses: [PokemonElements]
    let category: String
}

struct PokemonDetailViewPage: View {
    let uiModel : PokemonDetailViewPageUiModel
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(uiModel.pokemonElements.first!.mainColor)
                    .frame(height: 150)
                    .offset(y:-100)
                RoundedRectangle(cornerRadius: 60)
                    .fill(uiModel.pokemonElements.first!.mainColor)
                    .frame(height: 350)
                    .offset(y:-100)

                LinearGradient(gradient: Gradient(colors: [.white, .white, .clear, .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask(Image(uiModel.pokemonElements.first?.rawValue ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    )
                    .offset(y:-300)
                
                VStack(alignment: .leading) {
                    Spacer().frame(height: 120)
                    
                    HStack(alignment: .center) {
                        AsyncImage(url: URL(string: uiModel.pokemonImage)) {networkImage in
                            networkImage
                                .image?.resizable()
                                .scaledToFit()
                                .frame(width:200, height: 200)
                        }
                    }.frame(maxWidth: .infinity)
                    
                    Spacer().frame(height: 40)
                    
                    Text(uiModel.pokemonName)
                        .font(.title.bold())
                        .padding(.horizontal, 16)
                    
                    Text("N°\(uiModel.pokemonNumber)")
                        .font(.headline)
                        .padding(.horizontal, 16)
                    
                    
                    HStack {
                        ForEach(uiModel.pokemonElements, id: \.rawValue) { element in
                            PokemonElementTile(pokemonElement: element)
                        }
                    }.padding(.all, 16)
                    
                    Text(uiModel.pokemonDescription)
                        .font(.subheadline)
                        .padding(.horizontal, 16)
                    
                    Divider().padding(.vertical)
                    
                    VStack {
                        HStack {
                            PokemonDetailChip(chipLabel: "\(uiModel.weightOfPokemonInKG) kg", chipTitle: "Weight")
                            Spacer().frame(width: 30)
                            PokemonDetailChip(chipLabel: "\(uiModel.heightOfPokemonInM) m", chipTitle: "Height")
                        }.padding(.bottom, 20)
                        
                        HStack {
                            PokemonDetailChip(chipLabel: uiModel.category, chipTitle: "Category")
                            Spacer().frame(width: 30)
                            PokemonDetailChip(chipLabel: uiModel.ability, chipTitle: "Ability")
                        }
                    }.padding(.horizontal, 16)

                }
            }
        }
    }
}

struct PokemonDetailChip : View {
    let chipLabel: String
    let chipTitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(chipTitle)
            HStack {
                Spacer()
                Text(chipLabel)
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
            }
            .padding(.vertical, 14)
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(.gray.opacity(0.2), lineWidth: 1))
        }
    }
}

struct PokemonDetailViewPage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailViewPage(uiModel: PokemonDetailViewPageUiModel(
                pokemonElements: [PokemonElements.fire, PokemonElements.flying],
                pokemonName: "Charizard",
                pokemonImage: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/6.gif",
                pokemonNumber: "006",
                pokemonDescription: "Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.",
                weightOfPokemonInKG: 90.5,
                heightOfPokemonInM: 1.7,
                ability: "Blaze",
                weaknesses: [PokemonElements.rock, PokemonElements.electric, PokemonElements.water], category: "Flame"
            )
        )
    }
}
