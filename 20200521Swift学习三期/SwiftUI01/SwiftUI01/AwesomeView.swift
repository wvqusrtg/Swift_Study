//
//  AwesomeView.swift
//  SwiftUI01
//
//  Created by nixs on 2020/5/21.
//  Copyright © 2020 nixs. All rights reserved.
//

import SwiftUI

struct AwesomeView: View {
    var body: some View{
        Text("Hey!This is aawweesomee!")
    }
}

#if DEBUG
struct AwesomeView_Previews: PreviewProvider {
  static var previews: some View {
    AwesomeView()
  }
}
#endif
