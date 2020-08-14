//
//  NearesAirportsModel.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

struct NearestAirportModel: Decodable {
    let nearestAirportResource: NearestAirports
    enum CodingKeys: String, CodingKey {
        case nearestAirportResource = "NearestAirportResource"
    }
}
struct NearestAirports: Decodable {
    let airports: NearestAirport
    enum CodingKeys: String, CodingKey {
        case airports = "Airports"
    }
}
struct NearestAirport: Decodable {
    let airport: [AirportModelNearest]
    enum CodingKeys: String, CodingKey {
        case airport = "Airport"
    }
}
struct AirportModelNearest: Decodable {
    let airportCode: String
    let position: Position
    let cityCode: String
    let names: NearestAirportsNames
    enum CodingKeys: String, CodingKey {
        case airportCode = "AirportCode"
        case position = "Position"
        case cityCode = "CityCode"
        case names = "Names"
    }
}
struct Position: Decodable {
    let coordinate: CoordinateModel
    enum CodingKeys: String, CodingKey {
        case coordinate = "Coordinate"
    }
}
struct CoordinateModel: Decodable {
    let lat: Double
    let long: Double
    enum CodingKeys: String, CodingKey {
        case lat = "Latitude"
        case long = "Longitude"
    }
}
struct NearestAirportsNames: Decodable {
    let name: NearestAirportName
    enum CodingKeys: String, CodingKey {
        case name = "Name"
    }
}
struct NearestAirportName: Decodable {
    let languageCode: String
    let empty: String
    enum CodingKeys: String, CodingKey {
        case languageCode = "@LanguageCode"
        case empty = "$"
    }
}
