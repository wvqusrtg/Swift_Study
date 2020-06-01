//
//  ContentView.swift
//  SwiftUI01
//
//  Created by nixs on 2020/5/21.
//  Copyright © 2020 nixs. All rights reserved.
//

import SwiftUI

struct Hero: Identifiable {
    let id: UUID = UUID()
    let name: String
}


struct ContentView: View {
    let heros = [
        Hero(name: "Iron Man"),
        Hero(name: "Thor"),
        Hero(name: "Spider-Man"),
        Hero(name: "倪新生")
    ]
    var body: some View{
        List(heros){hero in
            Text(hero.name)
        }
    }
}

#if DEBUG
struct ContentView_Previews:PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
#endif
