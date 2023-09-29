//
//  CartView.swift
//  FoodCLUB
//
//  Created by Nikko Baez on 9/29/23.
//

import SwiftUI
import CoreLocation

struct CartView: View {
    @State var userRadius: Double = 5.0
    let userCart: [String] = ["Apples", "Milk", "Eggs", "Bread"]
    let userLocation = CLLocation(latitude: 33.0020381, longitude: -80.1519512)
    
    var body: some View {
        VStack {
            Text("My Cart")
                .font(.title)
                .fontWeight(.bold)
            
            ForEach(userCart, id: \.self) { item in
                HStack {
                    Text(item)
                    Spacer()
                }
                .padding()
            }
            
            Spacer()
        
            Picker("", selection: $userRadius) {
                Text("5 Miles").tag(5.0)
                Text("10 Miles").tag(10.0)
                Text("15 Miles").tag(15.0)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            NavigationLink {
                RetailerView(userRadius: userRadius, userLocation: userLocation, userCart: userCart)
            } label: {
                Text("Find Products")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            
        }
        .padding(.horizontal)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
