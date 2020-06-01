//
//  ToggleTextButton.swift
//  SwiftUI03
//
//  Created by nixs on 2020/5/21.
//  Copyright © 2020 nixs. All rights reserved.
//

import SwiftUI

struct ToggleTextButton: View {
    @Binding var isOn: Bool
    var body: some View {
        Button(
            action: {self.isOn.toggle()},
            label: {Text(self.isOn ? "Hide":"Show")}
        )
    }
}

struct ToggleTextButton_Previews: PreviewProvider {
    @State static var myCoolBool = true // Note: it must be static
    static var previews: some View {
        ToggleTextButton(isOn: $myCoolBool)
    }
}
