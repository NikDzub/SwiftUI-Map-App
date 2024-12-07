//
//  LocationsViewModel.swift
//  Map
//
//  Created by ihpt on 29/11/2024.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject, Observable {
    
//    All loaded locations
    @Published var locations: [Location]
    
//    Current location on map
    @Published var mapLocation : Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
//    Current region on map
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
//    Show list of locations
    @Published var showLocationsList: Bool = false
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location, toggle: Bool) {
        withAnimation(.easeInOut) {
            mapLocation = location
            if toggle {
                toggleLocationsList()
            }
        }
    }
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation })
        else {
            print("Could not find current index.")
            return
        }
        print(currentIndex)
        let nextIndex = currentIndex + 1
        if locations.indices.contains(nextIndex) {
            showNextLocation(location: locations[nextIndex], toggle: false)
        } else {
            showNextLocation(location: locations.first!, toggle: false)
            return
        }
    }
}
