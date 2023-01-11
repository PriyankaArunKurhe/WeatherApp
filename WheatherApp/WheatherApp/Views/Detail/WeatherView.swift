//
//  WeatherView.swift
//  WheatherApp
//
//  Created by Mac on 11/01/23.
//

import SwiftUI

struct WeatherView: View {
    @State private var searctText = ""
    
    var searchResults: [Forecast] {
        if searctText.isEmpty {
            return Forecast.cities
        } else {
            return Forecast.cities.filter { $0.location.contains(searctText) }
        }
    }
    var body: some View {
        ZStack {
            //MARK :Background Color
            Color.background
                .ignoresSafeArea()
            
            //MARK: Weather Widget
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(searchResults) { forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay {
            NavigationBar(searchText: $searctText)
        }
        .navigationBarHidden(true)
        .searchable(text: $searctText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for Cities")
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}
