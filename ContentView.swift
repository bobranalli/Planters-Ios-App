//
//  ContentView.swift
//  garden-app
//
//  Created by Bob Ranalli on 6/30/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var favFlowers : Array<Flower> = []
    
    var body: some View {
        NavigationView {
            GeometryReader { metrics in
                
                ZStack() {
                        
                    let russian_green = Color(red: 0.4039, green: 0.5725, blue: 0.4039)
                    
                    let laurel_green = Color(red: 0.6627, green: 0.7294, blue: 0.6157)
                     
                    let champagne = Color(red: 0.969, green: 0.906, blue: 0.808)
                    
                    let spanish_blue = Color(red: 0.0, green: 0.4392, blue: 0.7216)
                    
                    let dodger_blue = Color(red: 0.1176, green: 0.5647, blue: 1.0)
                        
                    laurel_green
                        .ignoresSafeArea()
                       
                       
                    VStack() {
                        
                        Group {
                            Text("Welcome to Planters!")
                                .foregroundColor(spanish_blue)
                                .bold()
                                .multilineTextAlignment(.center)
                                .font(.custom("Ubuntu-Medium", size: metrics.size.height > metrics.size.width ? metrics.size.width * 0.11: metrics.size.height * 0.11))
                            
                            Image("plant")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                       
                        Group {
                            
                            HStack() {
                                
                                Spacer()
                                NavigationLink(destination: FlowersList()) {
                                    Text("Find Flowers")
                                        .frame(width: 105, height: 50, alignment: .center)
                                        .background(dodger_blue)
                                        .foregroundColor(champagne)
                                }

                                NavigationLink(
                                    destination: SecondView(),
                                    label: {
                                        Text("Find Crops")
                                            .frame(width: 105, height: 50, alignment: .center)
                                            .background(dodger_blue)
                                            .foregroundColor(champagne)
                                    })
                                Spacer()
                            }
                            .font(.custom("Ubuntu-Medium", size: 17))
                            
                            Spacer()
                                .frame(height: 10)
                            
                            HStack() {
                                
                                NavigationLink(
                                    destination: GardenTips(),
                                    label: {
                                        Text("Garden Tips")
                                            .frame(width: 105, height: 50, alignment: .center)
                                            .background(spanish_blue)
                                            .foregroundColor(champagne)
                                    })
                            }
                            .font(.custom("Ubuntu-Medium", size: 17))
                            
                            Spacer()
                        }
                        
    
                        
                        Text("For All Your Sprouting Needs!")
                            .foregroundColor(russian_green)
                            .bold()
                            .multilineTextAlignment(.center)
                            .font(.custom("Ubuntu-Medium", size: metrics.size.height > metrics.size.width ? metrics.size.width * 0.10: metrics.size.height * 0.10))
                        
                        Spacer()
                            .frame(height: 40)
                        //Outside of group, inside of VStack
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
