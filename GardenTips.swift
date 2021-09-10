//
//  GardenTips.swift
//  garden-app
//
//  Created by Bob Ranalli on 7/20/21.
//

import SwiftUI

struct GardenTips: View {
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                let laurel_green = Color(red: 0.6627, green: 0.7294, blue: 0.6157)
                
                let dark_brown = Color(red: 0.3294, green: 0.2392, blue: 0.2157)
                 
                let champagne = Color(red: 0.969, green: 0.906, blue: 0.808)
                
                let spanish_blue = Color(red: 0.0, green: 0.4392, blue: 0.7216)
                
                laurel_green
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        Text("Garden Tips")
                            .foregroundColor(spanish_blue)
                            .bold()
                            .multilineTextAlignment(.center)
                            .font(.custom("Ubuntu-Regular", size: 45))
                        
                        Spacer()
                            .frame(height: 50)
                        
                        Group {
                            
                            Text("Soil")
                                .foregroundColor(dark_brown)
                                .bold()
                                .font(.custom("Ubuntu-Regular", size: 30))
                            
                            Spacer()
                                .frame(height: 10)
                            
                            Text("- The soil in containers heats up faster and leads to evaporation. Plants grown in containers need more water than garden plants. A good indicator is to water the soil containers until water is running freely out the bottom.")
                                .foregroundColor(champagne)
                                .font(.custom("Ubuntu-Regular", size: 20))
                            
                            Divider()
                            
                            Text("- Consider getting a soil test at your local gardening store before you plant! A basic soil test gives readings for soil pH, potassium (K), phosphorus (P), calcium (Ca), magnesium (Mg), and sulfur (S). A soil test will also let you know the level of organic matter, lead content, and give you recommendations for adjusting these levels.")
                                .foregroundColor(champagne)
                                .font(.custom("Ubuntu-Regular", size: 20))
                            
                            
                            Spacer()
                                .frame(height: 20)
                            
                            Text("Garden Design")
                                .foregroundColor(dark_brown)
                                .bold()
                                .font(.custom("Ubuntu-Regular", size: 30))
                            
                            Text("- When designing your garden, be sure to think about the placement of different heighted plants. For example, tomatoes and cucumbers benefit from 8 hours of sunlight a day. Grown tomato plants are taller than the cucumbers, potentially shading them from the sunlight they need. Plant tomatoes behind the cucumbers (in relation to the sunlight) so that both can get the full 8 hours they need. ")
                                .foregroundColor(champagne)
                                .font(.custom("Ubuntu-Regular", size: 20))
                            
                            Divider()
                            
                            
                            Text("- Having said that, some plants benefit from partial shade, especially in the hotter months. Be sure to check out the sunlight requirements of your plants")
                                .foregroundColor(champagne)
                                .font(.custom("Ubuntu-Regular", size: 20))
                            
                        }.frame(width: metrics.size.width * 0.90, alignment: .topLeading)
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Group {
                            Text("Fertalizer")
                                .foregroundColor(dark_brown)
                                .bold()
                                .font(.custom("Ubuntu-Regular", size: 30))
                            
                            Text("- Fertilizers have different ratios of nitrogen, phosphorus, and potassium. Knowing what your plant needs to grow would dictate which fertilizer to use. For example, tomatoes would benefit from a fertilizer with higher phosphorus content as opposed to a nitrogen content as that would promote more flowering, thus fruiting; you wouldn’t want a tomato plant with flourishing leaves and less fruits. Root vegetables would benefit from a higher potassium content as this focuses on the swelling of the root system.")
                                .foregroundColor(champagne)
                                .font(.custom("Ubuntu-Regular", size: 20))
                            
                            
                            Divider()
                            
                            Text("- Knowing NPK values in your fertalizer can help you develop targeted parts of your garden! N: leaf development, P: flower/fruit development, and K: root development ")
                                .foregroundColor(champagne)
                                .font(.custom("Ubuntu-Regular", size: 20))
                            
                            Spacer()
                                .frame(height: 20)
                            
                            Text("Other Stuff")
                                .foregroundColor(dark_brown)
                                .bold()
                                .font(.custom("Ubuntu-Regular", size: 30))
                            
                            Text("- Planting crops in different garden locations every year prevents the depletion of nutrients and interrupts the cycles of pests and diseases so the garden soil stays healthy.")
                                .foregroundColor(champagne)
                                .font(.custom("Ubuntu-Regular", size: 20))
                            
                            Divider()
                            
                            Text("- Follow the three-year rule for all garden crops. Rotate crops each year so that the same family of vegetables is not grown in the same place for three years. That gives enough time for soil pathogens to die.")
                                .foregroundColor(champagne)
                                .font(.custom("Ubuntu-Regular", size: 20))
                            
                        }.frame(width: metrics.size.width * 0.90, alignment: .topLeading)
                    }
                }
            }
        }
    }
}

struct GardenTips_Previews: PreviewProvider {
    static var previews: some View {
        GardenTips()
    }
}
