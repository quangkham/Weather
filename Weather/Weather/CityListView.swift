//
//  CityListView.swift
//  Weather
//
//  Created by TechFun on 25/03/2020.
//  Copyright © 2020 TechFunMyanmar. All rights reserved.
//

import SwiftUI

struct CityListView: View {
   
    @EnvironmentObject var cityStore  : CityStore
    @State private var isAddingCity : Bool = false
    @State private var isEditing : Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header : Text("Your Cities")){
                    ForEach(cityStore.cities){ city in
                        CityRow(city : city)
                    }
                .onDelete
                }
            }
        }
    }
}

struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        CityListView()
    }
}


struct CityRow : View {
    var city : City
    var body : some View {
        HStack {
            Text(city.name)
            Spacer()
            Text(String(describing: city.weather))
        }
    }
}
