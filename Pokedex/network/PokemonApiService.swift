//
//  PokemonApiService.swift
//  Pokedex
//
//  Created by Harsh Soni on 26/06/23.
//

import Foundation

class PokemonApiService {
    let baseURL: String = "https://pokeapi.co/api/v2/"
    let pokemonDetailsEndpoint: String  = "pokemon"
    let pokemonSpeciesEndpint: String = "pokemon-species"
    
    func fetchPokemonDetails(pokemonID: Int? = nil, pokemonURL: String? = nil) async -> PokemonModel? {
        guard let url = URL(string: pokemonURL ?? "\(baseURL)/\(pokemonDetailsEndpoint)/\(pokemonID ?? -1)") else {
            print("error in URL")
            return nil
        }
        
        do {
            let dataResponse = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(PokemonModel.self, from: dataResponse.0) {
                return decodedResponse
            }
        } catch {
            print("API fetch error")
        }
        
        return nil
    }
    
    func fetchPokemonDetails(limit: Int) async -> [PokemonModel]? {
        var pokemonModelList: [PokemonModel] = []
        
        guard let url = URL(string: "\(baseURL)/\(pokemonDetailsEndpoint)?limit=\(limit)") else {
            print("error in URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(PokemonInfoModel.self, from: data) {
                for resp in decodedResponse.results {
                    guard let pokemon = await fetchPokemonDetails(pokemonURL: resp.url) else {
                        print("No pokemon data")
                        return nil
                    }
                    pokemonModelList.append(pokemon)
                }
                return pokemonModelList
            }
        } catch {
            print("API fetch error")
        }
        
        print("No err no data")
        return nil
    }
}
