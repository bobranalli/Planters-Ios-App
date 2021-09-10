//
//  FlowerRow2.swift
//  garden-app
//
//  Created by Bob Ranalli on 8/9/21.
//

import SwiftUI

struct FlowerDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var flower: Flower
    
    var flowerIndex: Int {
       modelData.flowers.firstIndex(where: { $0.id == flower.id })!
    }
    
    let laurel_green = Color(red: 0.6627, green: 0.7294, blue: 0.6157)
    
    let dark_brown = Color(red: 0.3294, green: 0.2392, blue: 0.2157)
    let spanish_blue = Color(red: 0.0, green: 0.4392, blue: 0.7216)
    
    var body : some View {
        GeometryReader { metrics in
            ZStack {
                laurel_green
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Text("Below is the Planting Info For " + flower.name)
                       .foregroundColor(spanish_blue)
                       .multilineTextAlignment(.center)
                       .font(.custom("Ubuntu-Regular", size: 30))
                    
                    Spacer()
                        .frame(height: 40)
                    
                  
                    FavoriteButton(isSet: $modelData.flowers[flowerIndex].isFavorite)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    VStack {
                            Text(flower.description)
                            
                            Divider()
                                .frame(height: 10)
                           
                            VStack(alignment: .leading) {
                                Text("\u{2022} " + flower.soil)
                               
                                Spacer()
                                    .frame(height: 10)
                                
                                Text("\u{2022} " + flower.sun)
                               
                                Spacer()
                                    .frame(height: 10)
                                
                                Text("\u{2022} " + flower.water)
                            }
                        }.foregroundColor(dark_brown)
                        .font(.custom("Ubuntu-Regular", size: 20))
                        
                        Spacer()
                        
                }.frame(width: metrics.size.width * 0.90, alignment: .center)
            }
        }
    }
}

struct FlowerDetail_Previews: PreviewProvider {
    
    static let modelData = ModelData()
    
    static var previews: some View {
        FlowerDetail(flower: modelData.flowers[0])
            .environmentObject(modelData)
    }
}

