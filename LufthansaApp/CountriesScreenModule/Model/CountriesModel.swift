//
//  CountriesModel.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 10.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

struct CountriesModel: Decodable {
    let countryResourse: CountryResourse
    enum CodingKeys: String, CodingKey {
        case countryResourse = "CountryResource"
    }
}

struct CountryResourse: Decodable {
    let countries: Countries
    enum CodingKeys: String, CodingKey {
        case countries = "Countries"
    }
}

struct Countries: Decodable {
    let country: [Country]
    enum CodingKeys: String, CodingKey {
        case country = "Country"
    }
}

struct Country: Decodable {
    let countryCode: String
    let names: Names
    enum CodingKeys: String, CodingKey {
        case countryCode = "CountryCode"
        case names = "Names"
    }
}

struct Names: Decodable {
    let name: Name
    enum CodingKeys: String, CodingKey {
        case name = "Name"
    }
}

struct Name: Decodable {
    let languageCode: String
    let empty: String
    enum CodingKeys: String, CodingKey {
        case languageCode = "@LanguageCode"
        case empty = "$"
    }
}
