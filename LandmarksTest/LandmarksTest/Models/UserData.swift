//
//  UserData.swift
//  LandmarksTest
//
//  Created by Joonas Leminen on 20/01/2020.
//  Copyright © 2020 Joonas Leminen. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
