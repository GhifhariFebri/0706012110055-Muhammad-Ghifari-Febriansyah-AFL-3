//
//  FavoriteButton.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct FavoriteButton: View {
    //boolean for if already favorite
    @Binding var isSet: Bool

    var body: some View {
    Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
