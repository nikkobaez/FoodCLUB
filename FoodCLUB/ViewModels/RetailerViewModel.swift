//
//  RetailerViewModel.swift
//  FoodCLUB
//
//  Created by Nikko Baez on 9/28/23.
//

import Foundation

class RetailerViewModel: ObservableObject {
    var retailers: [RetailerModel] = {
        guard let json = Bundle.main.url(forResource: "retailers", withExtension: ".json") else {
            fatalError("Unable To Load JSON")
        }
        do {
            let jsonData = try Data(contentsOf: json)
            return try JSONDecoder().decode([RetailerModel].self, from: jsonData)
        } catch {
            fatalError("Unable To Parse JSON")
        }
    }()
}
