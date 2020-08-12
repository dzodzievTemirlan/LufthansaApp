//
//  CitiesModel.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

struct CitiesModel: Decodable {
    let cityResource : Cities
    enum CodingKeys: String, CodingKey {
        case cityResource = "CityResource"
    }
}

struct Cities: Decodable {
    let cities: City
    enum CodingKeys: String, CodingKey {
        case cities = "Cities"
    }
}

struct City: Decodable {
    let city: [CityModel]
    enum CodingKeys: String, CodingKey {
        case city = "City"
    }
}
struct CityModel: Decodable {
    let names: CityName
    enum CodingKeys: String, CodingKey {
        case names = "Names"
    }
}
struct CityName: Decodable {
    let name: NameModel
    enum CodingKeys: String, CodingKey {
        case name = "Name"
    }
}
struct NameModel: Decodable {
    let languageCode: String
    let empty: String
    enum CodingKeys: String, CodingKey {
        case languageCode = "@LanguageCode"
        case empty = "$"
    }
}
