//
//  PokemonDetail.swift
//  SwiftUI03
//
//  Created by nixs on 2020/5/22.
//  Copyright © 2020 nixs. All rights reserved.
//

import SwiftUI

struct PokemonDetail: View {
    let pokemon:Pokemon
    var body: some View {
        VStack {
            Image(pokemon.name.lowercased())
                .resizable()
                .frame(width: 200, height: 200, alignment: Alignment.center)
                .border(pokemon.color, width: 5)
            Text(pokemon.type)
                .font(.title)
                .frame(width: UIScreen.main.bounds.width-50, height: 50, alignment: Alignment.center)
                .background(pokemon.color)
                .foregroundColor(Color.white)
            Spacer()
        }.navigationBarTitle(Text(pokemon.name),displayMode: .inline)
    }
}

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetail(
            pokemon: Pokemon(
                id: 0, name: "Charmander", type: "Fire", color: .red
            )
        )
    }
}
