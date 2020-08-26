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

class AirportModel: NSObject, Decodable, NSCoding {
  let cityCode: String
  let countryCode: String
  let names: AirportNames
  
  enum CodingKeys: String, CodingKey {
    case cityCode = "CityCode"
    case countryCode = "CountryCode"
    case names = "Names"
  }
  
  init(cityCode: String, countryCode: String, names: AirportNames) {
    self.cityCode = cityCode
    self.countryCode = countryCode
    self.names = names
  }
  
  func encode(with coder: NSCoder) {
    coder.encode(cityCode, forKey: "cityCode")
    coder.encode(countryCode, forKey: "countryCode")
    coder.encode(names, forKey: "names")
  }
  
  public required convenience init?(coder: NSCoder) {
    let cityCode = coder.decodeObject(forKey: "cityCode") as! String
    let countryCode = coder.decodeObject(forKey: "countryCode") as! String
    let names = coder.decodeObject(forKey: "names") as! AirportNames
    self.init(cityCode: cityCode, countryCode: countryCode, names: names)
  }
}

class AirportNames: NSObject, Decodable, NSCoding {
  let name: AirportNameModel
  
  enum CodingKeys: String, CodingKey {
    case name = "Name"
  }
  
  init(name: AirportNameModel) {
    self.name = name
  }
  
  func encode(with coder: NSCoder) {
    coder.encode(name, forKey: "name")
  }
  
  public required convenience init?(coder: NSCoder) {
    let name = coder.decodeObject(forKey: "name") as! AirportNameModel
    self.init(name: name)
  }
}

class AirportNameModel:NSObject, Decodable, NSCoding {
  let languageCode, empty : String
  
  enum CodingKeys: String, CodingKey {
    case languageCode = "@LanguageCode"
    case empty = "$"
  }
  
  init(languageCode: String, empty: String) {
    self.languageCode = languageCode
    self.empty = empty
  }
  
  func encode(with coder: NSCoder) {
    coder.encode(languageCode, forKey: "languageCode")
    coder.encode(empty, forKey: "empty")
  }
  
  public required convenience init?(coder: NSCoder) {
    let languageCode = coder.decodeObject(forKey: "languageCode") as! String
    let empty = coder.decodeObject(forKey: "empty") as! String
    self.init(languageCode: languageCode, empty: empty)
  }
}
