//
//  LandmarkList.swift
//  LandmarksTest
//
//  Created by Joonas Leminen on 13/01/2020.
//  Copyright © 2020 Joonas Leminen. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var userData: UserData
    
    @State var showFavoritesOnly = true
    @State var landmark = landmarkData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)
                    .environmentObject(self.userData)) {
                        LandmarkRow(landmark: landmark)
                        }
                    }
                }
                .onMove(perform: move)
                .onDelete(perform: delete)
            }
            .navigationBarTitle(Text("Landmarks"))
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        landmark.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
        landmark.remove(atOffsets: offsets)
    }
    
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}

