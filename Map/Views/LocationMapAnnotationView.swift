//
//  LocationMapAnnotationView.swift
//  Map
//
//  Created by ihpt on 07/12/2024.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "mappin")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.red)
                .shadow(color:Color.red, radius: 4)
        }
    }
}

#Preview {
    LocationMapAnnotationView()
}
