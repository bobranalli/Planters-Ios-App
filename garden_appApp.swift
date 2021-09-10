//
//  garden_appApp.swift
//  garden-app
//
//  Created by Bob Ranalli on 6/30/21.
//

import SwiftUI

@main
struct garden_appApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
