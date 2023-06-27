//
//  GIFImage.swift
//  Pokedex
//
//  Created by Harsh Soni on 23/06/23.
//

import SwiftUI
import WebKit

struct GIFImage: UIViewRepresentable {
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.reload()
    }
    
    private let name:String
    
    init(_ name: String) {
        self.name = name
    }
    
    func makeUIView(context: Context) -> some WKWebView {
        let webview = WKWebView()
        let data = try! Data(contentsOf: URL(string: name)!)
        webview.load(data,
                     mimeType: "image/gif",
                     characterEncodingName: "UTF-8",
                     baseURL: URL(string: name)!
                    )
        return webview
    }
}

struct GIFImage_Previews: PreviewProvider {
    static var previews: some View {
        GIFImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/6.gif")
    }
}
