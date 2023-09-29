//
//  FoodCLUBApp.swift
//  FoodCLUB
//
//  Created by Nikko Baez on 9/28/23.
//

import SwiftUI

@main
struct FoodCLUBApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                CartView()
            }
        }
    }
}
