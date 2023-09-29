//
//  ProductModel.swift
//  FoodCLUB
//
//  Created by Nikko Baez on 9/28/23.
//

import Foundation

struct ProductModel: Decodable, Identifiable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
}
