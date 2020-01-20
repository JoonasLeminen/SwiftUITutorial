//
//  ContentView.swift
//  LandmarksTest
//
//  Created by Joonas Leminen on 13/01/2020.
//  Copyright © 2020 Joonas Leminen. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    @State private var showingAlert = false
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }

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
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }

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
        let userData = UserData()
        return LandmarkDetail(landmark: userData.landmarks[0])
        .environmentObject(userData)
    }
}

