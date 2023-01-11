//
//  ForecastCard.swift
//  WheatherApp
//
//  Created by Mac on 11/01/23.
//

import SwiftUI

struct ForecastCard: View {
    var forecast: Forecast
    var forecastPeriod: ForecastPeriod
    
    
    var isActive: Bool {
        if forecastPeriod == ForecastPeriod.hourly {
            let isHour = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .hour)
            return isHour
        } else {
            let isToday = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .day)
            return isToday
        }
    }
    var body: some View {
        ZStack {
            //MARK: card
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.forecastCardBackground.opacity(isActive ? 1 : 0.2))
                .frame(width: 60, height: 146)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 5, y: 4)
                .overlay {
                    //MARK: Card Border
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(.white.opacity(isActive ? 0.5 : 0.2))
                        .blendMode(.overlay)
                }
                .innerShadow(shape: RoundedRectangle(cornerRadius: 30), color: .white, lineWidth: 0.25, offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay)
            
            VStack(spacing: 16) {
                //MARK: Forecast Date
                Text(forecast.date, format: forecastPeriod == ForecastPeriod.hourly ? .dateTime.hour() : .dateTime.weekday())
                    .font(.subheadline.weight(.semibold))
                
                
                VStack(spacing: -4) {
                    //MARK: Forecast Small icon
                    Image("\(forecast.icon) small")
                    
                    //MARK: Forecast Probability
                    Text(forecast.probability, format: .percent)
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(Color.probabilityText)
                        .opacity(forecast.probability > 0 ? 1 : 0)
                }
                .frame(height: 42)
                
                //MARK: Forecast Temprature
                Text("\(forecast.temperature)°")
                    .font(.title3)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .frame(width: 60, height: 146)
            
         
        }
    }
}

struct ForecastCard_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCard(forecast: Forecast.hourly[0], forecastPeriod: .hourly)
    }
}
