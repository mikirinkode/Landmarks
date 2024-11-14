//
//  LandmarkLis.swift
//  Landmarks
//
//  Created by MacBook on 12/11/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmars: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite
            )}
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites Only")
                }
                ForEach(filteredLandmars){ landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    
                    
                }
                .animation(.default, value: filteredLandmars)
                .navigationTitle("Landmarks")
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList().environment(ModelData())
}
