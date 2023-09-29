//
//  ContentView.swift
//  FoodCLUB
//
//  Created by Nikko Baez on 9/28/23.
//

import SwiftUI
import CoreLocation

struct RetailerView: View {
    @StateObject var viewModel: RetailerViewModel = RetailerViewModel()
    @State var retailers: [RetailerModel] = []
    @State var productsNotAvailable: [String] = []
    let userRadius: Double
    let userLocation: CLLocation
    let userCart: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
             // retailers with products
            Text("Available Near You")
                .font(.title)
                .fontWeight(.bold)
            
            ForEach(retailers) { retailer in
                Text(retailer.name)
                    .font(.title3)
                    .fontWeight(.bold)
                ForEach(retailer.available) { product in
                    Text(product.name)
                }
            }
            
            // products with no retailers
            Text("Not Available")
                .font(.title)
                .fontWeight(.bold)
            
            ForEach(productsNotAvailable, id: \.self) { product in
                Text(product)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .onAppear {
            showRetailersWithProducts(miles: userRadius)
            showProductsNotAvailable()
        }
        
    }
}

struct RetailerView_Previews: PreviewProvider {
    static var previews: some View {
        RetailerView(
            userRadius: 5.0,
            userLocation: CLLocation(latitude: 33.0020381, longitude: -80.1519512),
            userCart: ["Apples", "Milk", "Eggs", "Bread"]
        )
    }
}

// MARK: FUNCTIONS
extension RetailerView {
    func findRetailersNearUser(miles: Double) -> [RetailerModel] {
        var retailersNearUser: [RetailerModel] = []
        var milesToMeters: Double {
            return miles * 1609.34
        }

        for retailer in viewModel.retailers {
            if userLocation.distance(from: retailer.location) < milesToMeters {
                retailersNearUser.append(retailer)
            }
        }

        return retailersNearUser
    }

    func showRetailersWithProducts(miles: Double) {
        var retailersNearUser = findRetailersNearUser(miles: miles)

        for (index, _) in retailersNearUser.enumerated() {
            retailersNearUser[index].available.removeAll()
        }

        for (index, retailer) in retailersNearUser.enumerated() {
            for product in retailer.products {
                if userCart.contains(product.name) {
                    retailersNearUser[index].available.append(product)
                }
            }
        }

        retailers = retailersNearUser
    }
    
    func showProductsNotAvailable() {
        productsNotAvailable.removeAll()
        
        for product in userCart {
            if !retailers.contains(where: {$0.products.contains(where: {$0.name == product})}) {
                productsNotAvailable.append(product)
            }
        }
    }
}

