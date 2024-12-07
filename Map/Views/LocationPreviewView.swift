//
//  LocationPreviewView.swift
//  Map
//
//  Created by ihpt on 03/12/2024.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel

    let location: Location
    
    var body: some View {
        
        HStack() {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSection
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.white)
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
            .frame(maxHeight: .infinity, alignment: .top)
            
            
            
        }
        .padding(15)
        .frame(maxHeight: 200)
        .background(Color.black.opacity(0.5))
    }
}

#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!)
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
            }
        }
        .padding(6)
        .background(Color(.white))
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title3)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
                .fontWeight(.bold)
        }
        
    }
    
    private var learnMoreButton: some View {
        Button {} label: {
            Text("Learn More")
                .font(.headline)
        }
        .buttonStyle(.plain)
        .frame(width: 120, height: 45)
//        .border(.gray)
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
    
//    FIN THE BORDER
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
        }
        .buttonStyle(.plain)
        .frame(width: 120, height: 45)
        .background(Color(.systemGray6))
//        .border(.gray)
        .cornerRadius(10)
        
    }
    
}
