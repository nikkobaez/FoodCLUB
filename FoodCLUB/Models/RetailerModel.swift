//
//  RetailerModel.swift
//  FoodCLUB
//
//  Created by Nikko Baez on 9/28/23.
//

import Foundation
import CoreLocation

struct RetailerModel: Decodable, Identifiable {
    let id: String
    var name: String
    let location: CLLocation
    var products: [ProductModel]
    var available: [ProductModel] = []
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case longitude
        case latitude
        case products
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        self.location = CLLocation(latitude: latitude, longitude: longitude)
        self.products = try container.decode([ProductModel].self, forKey:.products)
    }
}
