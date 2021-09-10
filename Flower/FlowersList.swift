//
//  FlowersView.swift
//  garden-app
//
//  Created by Bob Ranalli on 7/30/21.
//

import SwiftUI

struct FlowersList: View {
    
    let laurel_green = Color(red: 0.6627, green: 0.7294, blue: 0.6157)

    let dark_brown = Color(red: 0.3294, green: 0.2392, blue: 0.2157)

    let champagne = Color(red: 0.969, green: 0.906, blue: 0.808)

    let spanish_blue = Color(red: 0.0, green: 0.4392, blue: 0.7216)
    
    var new_flowers = Flower.loadCSV(from: "flower")
    
    @State private var searchText = ""
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly = false
    
    var filteredFlowers: [Flower] {
        modelData.flowers.filter { flower in
            (!showFavoritesOnly || flower.isFavorite)
        }
    }
    
    var search_flowers: [Flower] {
        modelData.flowers.filter ({
            searchText.isEmpty ? true : $0.name.contains(searchText)
        })
    }
    
    var body: some View {
        ZStack {
            laurel_green
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Find Your Flowers")
                   .foregroundColor(spanish_blue)
                   .multilineTextAlignment(.center)
                   .font(.custom("Ubuntu-Regular", size: 30))
                
                Spacer()
                    .frame(height: 50)
                 
                SearchBar(text: $searchText)
                    .padding(.top, -30)
                     
//                (new_flowers.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) }))
                
                List {
                    
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Your Garden")
                    }
                    
                    ForEach(filteredFlowers) { flower in
                        if(searchText.isEmpty ? true : flower.name.contains(searchText)) {
                            NavigationLink(destination: FlowerDetail(flower: flower)) {
                                FlowerRow(new_flower: flower)
                            }
                        }
                    }
                }.colorMultiply(champagne)
                .id(UUID())
                .foregroundColor(dark_brown)
                .listStyle(InsetGroupedListStyle())
                .font(.custom("Ubuntu-Regular", size: 14))
            }
        }
    }
}

//struct FlowersList_Previews: PreviewProvider {
//    static var previews: some View {
//        FlowersList()
//    }
//}
