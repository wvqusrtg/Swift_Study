//
//  ContentView.swift
//  SwiftUI02
//
//  Created by nixs on 2020/5/21.
//  Copyright © 2020 nixs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var pokemonName = "Charmander-default"
    
    var body: some View {
        VStack {
            Text(pokemonName)
                .frame(width: UIScreen.main.bounds.width, height: 50, alignment: Alignment.center)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .padding(10)
            Button(
                action: { self.switchPokemon() },
                label: {Text("Switch")}
            ).frame(width: UIScreen.main.bounds.width*0.9, height: 50, alignment: Alignment.center)
                .background(Color.red)
                .foregroundColor(Color.white)
        }
    }
    
    func switchPokemon() {
        //pokemonName = "Pikachu"
        let list = ["Squirtle-倪新生-01", "Bulbasaur-韩露-02", "Charmander-倪新伟-03", "Pikachu-珂珂-04"]
        pokemonName = list.randomElement() ?? ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
