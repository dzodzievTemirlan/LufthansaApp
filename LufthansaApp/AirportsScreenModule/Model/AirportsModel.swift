//
//  AirportsModel.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

struct AirportsModel: Decodable {
    let airportsResource: Airports
    enum CodingKeys: String, CodingKey {
        case airportsResource = "AirportResource"
    }
}

struct Airports: Decodable {
    let airports: Airport
    enum CodingKeys: String, CodingKey {
        case airports = "Airports"
    }
}

struct Airport: Decodable {
    let airport: [AirportModel]
    enum CodingKeys: String, CodingKey {
        case airport = "Airport"
    }
}
struct AirportModel: Decodable {
    let cityCode: String
    let countryCode: String
    let names: AirportNames
    enum CodingKeys: String, CodingKey {
        case cityCode = "CityCode"
        case countryCode = "CountryCode"
        case names = "Names"
    }
}
struct AirportNames: Decodable {
    let name: AirportNameModel
    enum CodingKeys: String, CodingKey {
        case name = "Name"
    }
}

struct AirportNameModel: Decodable {
    let languageCode, empty : String
    enum CodingKeys: String, CodingKey {
        case languageCode = "@LanguageCode"
        case empty = "$"
    }
}
