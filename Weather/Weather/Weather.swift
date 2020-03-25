//
//  Weather.swift
//  Weather
//
//  Created by TechFun on 24/03/2020.
//  Copyright © 2020 TechFunMyanmar. All rights reserved.
//

import SwiftUI

struct Weather : Codable {
    var current : HourlyWeather
    var hours : Weather.List<HourlyWeather>
    var week : Weather.List<DailyWeather>
    
    enum CodingKeys : String, CodingKey {
        case current = "currently"
        case hours = "hours"
        case week = "daily"
    }
}

extension Weather {
    
    struct List<T : Codable & Identifiable> : Codable {
        
        var list : [T]
        enum CodingKeys : String, CodingKey{
            case list = "data"
        }
    }
    
    enum Icon : String , Codable {
       case clearDay = "clear-day"
             case clearNight = "clear-night"
             case rain = "rain"
             case snow = "snow"
             case sleet = "sleet"
             case wind = "wind"
             case fog = "fog"
             case cloudy = "cloudy"
             case partyCloudyDay = "partly-cloudy-day"
             case partyCloudyNight = "partly-cloudy-night"
        
        var image: Image {
                   switch self {
                   case .clearDay:
                       return Image(systemName: "sun.max.fill")
                   case .clearNight:
                       return Image(systemName: "moon.stars.fill")
                   case .rain:
                       return Image(systemName: "cloud.rain.fill")
                   case .snow:
                       return Image(systemName: "snow")
                   case .sleet:
                       return Image(systemName: "cloud.sleet.fill")
                   case .wind:
                       return Image(systemName: "wind")
                   case .fog:
                       return Image(systemName: "cloud.fog.fill")
                   case .cloudy:
                       return Image(systemName: "cloud.fill")
                   case .partyCloudyDay:
                       return Image(systemName: "cloud.sun.fill")
                   case .partyCloudyNight:
                       return Image(systemName: "cloud.moon.fill")
                   }
               }
    }
}



struct DailyWeather: Codable, Identifiable {
    
    var id: Date {
        return time
    }
    
    var time: Date
    var maxTemperature: Double
    var minTemperature: Double
    var icon: Weather.Icon
    
    enum CodingKeys: String, CodingKey {
        
        case time = "time"
        case maxTemperature = "temperatureHigh"
        case minTemperature = "temperatureLow"
        case icon = "icon"
        
    }
    
}

struct HourlyWeather  : Codable, Identifiable {
    
    var id : Date{
        return time
    }
    
    var time : Date
    var temperature : Double
    var icon : Weather.Icon
    
    
}

class WeatherManager {
    
    static let key  : String = "2b8d464a48msha826930d82a5924p16ae62jsncbf73b986107"
    static let baseURL : String = "https://api.darksky.net/forecast/\(key)/"
}
