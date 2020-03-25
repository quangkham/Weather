//
//  City.swift
//  Weather
//
//  Created by TechFun on 24/03/2020.
//  Copyright © 2020 TechFunMyanmar. All rights reserved.
//

import SwiftUI
import Combine

class City : ObservableObject {
    
    var didChange = PassthroughSubject<City ,Never>()
    let name : String
    var weather : Weather? {
        didSet {
            didChange.send(self)
        }
    }
    
    init(name : String) {
        self.name = name
        self.getWeather()
    }
    
    private func getWeather(){
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?id=524901&appid=58f7936547675ad490437066ff7f1fc2") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response , error) in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                
                let weatherobject = try decoder.decode(Weather.self
                    , from: data)
                DispatchQueue.main.async {
                    self.weather = weatherobject
                }
            }catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
