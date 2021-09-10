//
//  FlowerRow.swift
//  garden-app
//
//  Created by Bob Ranalli on 8/7/21.
//

import SwiftUI

struct FlowerRow: View {
    
    var new_flower: Flower
    
    var body: some View {
        
        HStack {
            
            if new_flower.isFavorite {
               Image(systemName: "star.fill")
                   .foregroundColor(.yellow)
            }
            Spacer()
                .frame(width: 20)
            Text(new_flower.name)
        }
    }
}

struct FlowerRow_Previews: PreviewProvider {
    
    static var flowers = ModelData().flowers
    
    static var previews: some View {
        Group {
            FlowerRow(new_flower: flowers[0])
            FlowerRow(new_flower: flowers[1])
        }
    }
}
