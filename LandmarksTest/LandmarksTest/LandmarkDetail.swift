//
//  ContentView.swift
//  LandmarksTest
//
//  Created by Joonas Leminen on 13/01/2020.
//  Copyright © 2020 Joonas Leminen. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    @State private var showingAlert = false

    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
                    Button(action: {
                        self.showingAlert = true
                    }) {
                        Text("Delete")
                        Image(systemName: "trash")
                    }
                        
            .padding(.top, 20)
            
            .alert(isPresented: $showingAlert) {
            Alert(title: Text("You are deleting this file"), message: Text("Really delete?"), primaryButton: .default(Text("Cancel")), secondaryButton: .destructive(Text("Delete")))
                }
                    
//            Button(action: {
//                        //Action
//                    }) {
//                        Text("Add")
//                        Image(systemName: "plus")
//                    }
//            .padding(.top, 20)

            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)

                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(verbatim: landmark.name), displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
    }
}

