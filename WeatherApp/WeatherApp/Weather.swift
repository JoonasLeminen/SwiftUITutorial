//
//  Weather.swift
//  WeatherApp
//
//  Created by Joonas Leminen on 17/01/2020.
//  Copyright © 2020 Joonas Leminen. All rights reserved.
//

import SwiftUI

struct Weather: View {
    var body: some View {
        ZStack {
            Image("light_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            HStack {
                VStack {
                Text("Päivämäärä")
                Text("vettä sataa ja harmittaa")
                Text("Lämpötila")
                }
                Image(systemName: "icloud.fill")
            }
        
        }
        .navigationBarTitle("Lappeenranta")
    }
}
    
    struct Weather_Previews: PreviewProvider {
        static var previews: some View {
            Weather()
        }
}
