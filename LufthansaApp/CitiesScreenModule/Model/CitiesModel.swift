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
class CityModel: NSObject, Decodable, NSCoding {
  let names: CityName
  
  enum CodingKeys: String, CodingKey {
    case names = "Names"
  }
  
  init (names: CityName) {
    self.names = names
  }
  
  func encode(with coder: NSCoder) {
    coder.encode(names, forKey: "names")
  }
  
  public required convenience init?(coder: NSCoder) {
    let names = coder.decodeObject(forKey: "names") as! CityName
    self.init(names: names)
  }
}
class CityName: NSObject, Decodable, NSCoding {
  let name: NameModel
  
  enum CodingKeys: String, CodingKey {
    case name = "Name"
  }
  
  init(name: NameModel) {
    self.name = name
  }
  
  func encode(with coder: NSCoder) {
    coder.encode(name, forKey: "name")
  }
  
  public required convenience init?(coder: NSCoder) {
    let name = coder.decodeObject(forKey: "name") as! NameModel
    self.init(name: name)
  }
}

class NameModel:NSObject, Decodable, NSCoding {
  let languageCode: String
  let empty: String
  
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
