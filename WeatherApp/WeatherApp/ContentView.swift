//
//  ContentView.swift
//  WeatherApp
//
//  Created by Joonas Leminen on 17/01/2020.
//  Copyright © 2020 Joonas Leminen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
        ZStack
            {
                Image("light_background")
                    .resizable()
                    .blur(radius: 2.5)
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                NavigationLink(destination: Weather()) {
                Text("Lappeenranta")
                    .navigationBarTitle("WeatherApp")
                    .font(.largeTitle)
                    }
                }
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
