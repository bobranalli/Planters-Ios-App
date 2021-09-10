//
//  FavoriteButton.swift
//  garden-app
//
//  Created by Bob Ranalli on 8/9/21.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    let spanish_blue = Color(red: 0.0, green: 0.4392, blue: 0.7216)

    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            HStack {
                Text("Add to Garden")
                    .foregroundColor(spanish_blue)
                    .multilineTextAlignment(.center)
                    .font(.custom("Ubuntu-Regular", size: 14))
                Image(systemName: isSet ? "star.fill" : "star")
                    .foregroundColor(isSet ? Color.yellow : Color.gray)
            }
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
