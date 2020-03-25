//
//  CityStore.swift
//  Weather
//
//  Created by TechFun on 25/03/2020.
//  Copyright © 2020 TechFunMyanmar. All rights reserved.
//

import SwiftUI
import Combine

class CityStore : ObservableObject{
    let didChange = PassthroughSubject<CityStore , Never>()
    var cities : [City] = [City(name: "Yangon")] {
        didSet{
            didChange.send(self)
        }
    }
}
