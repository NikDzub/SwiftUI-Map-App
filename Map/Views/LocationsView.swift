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
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
        
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
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
            Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                .font(.title3)
                .fontWeight(.medium)
                .foregroundStyle(.primary)
                .frame(height: 45)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading){
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.primary)
                }
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(color: Color.blue.opacity(0.4), radius: 20, x: 0, y: 15)
        }
    }
}
