//
//  LocationsView.swift
//  Map
//
//  Created by ihpt on 27/11/2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {

    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack{
//            Map(coordinateRegion: $vm.mapRegion)
            Map(coordinateRegion: $vm.mapRegion,
                annotationItems: vm.locations,
                annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .onTapGesture {
                            vm.showNextLocation(location: location, toggle: false)
                        }
                }
            })
                .ignoresSafeArea()
        
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
                
                ZStack {
                    LocationPreviewView(location: vm.mapLocation)
                        .cornerRadius(20)
                        .padding(10)
                        .shadow(color: Color.blue.opacity(0.7), radius: 10)

                }
            }
        }
    }
}

#Preview {
    LocationsView()
        .environment(LocationsViewModel())
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(Color(.black))
                    .frame(height: 45)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.primary)
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.4), radius: 20, x: 0, y: 0)
    }
}
