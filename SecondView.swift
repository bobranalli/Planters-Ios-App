//
//  Created by Bob Ranalli on 7/2/21.
//

import SwiftUI

struct SecondView: View {
    
    let laurel_green = Color(red: 0.6627, green: 0.7294, blue: 0.6157)

    let dark_brown = Color(red: 0.3294, green: 0.2392, blue: 0.2157)

    let champagne = Color(red: 0.969, green: 0.906, blue: 0.808)

    let spanish_blue = Color(red: 0.0, green: 0.4392, blue: 0.7216)
    
    var plants = Plant.loadCSV(from: "plants3")
    
    @State private var searchText = ""
     
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                laurel_green
                    .edgesIgnoringSafeArea(.all)
                 VStack {
                         Text("Search For Compatible Species")
                            .foregroundColor(spanish_blue)
                            .multilineTextAlignment(.center)
                            .font(.custom("Ubuntu-Regular", size: 30))
                    
                        Text("***Compatible Species are plants that grow well togehter and help each other out!***")
                           .foregroundColor(spanish_blue)
                           .bold()
                           .multilineTextAlignment(.center)
                           .font(.custom("Ubuntu-Regular", size: 12))
                                             
                    Spacer()
                        .frame(height: 50)
                     
                    SearchBar(text: $searchText)
                        .padding(.top, -30)
                         
                    
                    List(plants.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })) { item in
                        if(item.name != "") {
                            NavigationLink(
                                destination: CompList(forPlantName: item.name),
                                label: {
                                    PlantView(new_plant: item)
                                })
                        }
                        
                    }.colorMultiply(champagne)
                    .id(UUID())
                 }
            }
        }
    }
}
            
struct CompList : View {
    
    let laurel_green = Color(red: 0.6627, green: 0.7294, blue: 0.6157)
    let spanish_blue = Color(red: 0.0, green: 0.4392, blue: 0.7216)
    let champagne = Color(red: 0.969, green: 0.906, blue: 0.808)
    let dark_brown = Color(red: 0.3294, green: 0.2392, blue: 0.2157)
    
    var forPlantName: String
    var compatibleSpecies = Compatible.loadCSV(from: "comp")
    
    var counter = 0
    
    var body : some View {
        ZStack {
            laurel_green
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Below are the Compatible Species For " + forPlantName)
                   .foregroundColor(spanish_blue)
                   .multilineTextAlignment(.center)
                   .font(.custom("Ubuntu-Regular", size: 30))
                
                List {
                    ForEach(compatibleSpecies.filter {$0.plant_name.contains(forPlantName)}) {
                        comp in
                        ForEach(comp.compatible_species.indices) { i in
                            if(comp.compatible_species[i] != "" && !comp.compatible_species[i].contains { $0.isNewline}) {
                                DisclosureGroup(comp.compatible_species[i]){
                                    CompPlant(compatiblePlantName: comp.compatible_species[i])
                                }
                            }
                        }
                    }
                }.colorMultiply(champagne)
                .foregroundColor(dark_brown)
                .id(UUID())
                
                //outside of list
            }
        }
    }
}

struct CompPlant : View {
    
    let dark_brown = Color(red: 0.3294, green: 0.2392, blue: 0.2157)
    
    var compatiblePlantName: String
    var plants = Plant.loadCSV(from: "plants3")
    
    var body : some View {
        
        ForEach(plants) { plant in
            if(compatiblePlantName == plant.name) {
                HStack {
                    Image(plant.abb)
                        .resizable()
                        .frame(width: 80, height: 70)
                        .scaledToFit()
                    VStack {
                        
                        Text("Find below some planting information!").font(.system(size: 14, weight: .heavy))
                        Text("Growing Times: " + plant.time)
                        Text("Weekly Water: " + plant.water)
                        Text("Planting Distance: " + plant.plant_distance)
                        
                        Spacer()
                            .frame(height: 15)
                        
                        Text("FUN FACT").font(.system(size: 14, weight: .heavy))
                        Text(plant.extras)
                        
                    }.foregroundColor(dark_brown)
                    .multilineTextAlignment(.center)
                    .font(.custom("Ubuntu-Regular", size: 12))
                }
            }
        }.listStyle(GroupedListStyle())
    }
}

struct PlantView : View {
    
    var new_plant: Plant
    
    let dark_brown = Color(red: 0.3294, green: 0.2392, blue: 0.2157)
    let spanish_blue = Color(red: 0.0, green: 0.4392, blue: 0.7216)
    
    var body : some View {
        HStack() {
//            Image(new_plant.abb)
//                .resizable()
//                .frame(width: 80, height: 70)
//                .scaledToFit()
            
            Spacer()
                .frame(width: 40)
            
            VStack(alignment: .center) {
                Text(new_plant.name)
                    .bold()
                Text("Growing Times: " + new_plant.time)
                Text("Weekly Water: " + new_plant.water)
                Text("Height: " + new_plant.height) 
                Text("Planting Distance: " + new_plant.plant_distance)
            }.foregroundColor(dark_brown)
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
