//
//  LocationsListView.swift
//  Map
//
//  Created by ihpt on 29/11/2024.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button (action: {vm.showNextLocation(location: location)}) {
                    listRowView(location: location)
                }
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationsListView()
        .environment(LocationsViewModel())
}

extension LocationsListView {
    
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 45)
                    .cornerRadius(5)
            }
            
            VStack (alignment: .leading) {
                Text(location.name)
                    .fontWeight(.medium)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
    }
}
