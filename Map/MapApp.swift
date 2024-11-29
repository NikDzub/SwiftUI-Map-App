//
//  MapApp.swift
//  Map
//
//  Created by ihpt on 27/11/2024.
//

import SwiftUI

@main
struct MapApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environment(vm)
        }
    }
}
