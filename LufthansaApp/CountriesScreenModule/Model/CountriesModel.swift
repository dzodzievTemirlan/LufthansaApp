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

public class Country: NSObject, Decodable, NSCoding {
  let countryCode: String
  let names: Names
  enum CodingKeys: String, CodingKey {
    case countryCode = "CountryCode"
    case names = "Names"
  }
  init(countryCode: String, names: Names) {
    self.countryCode = countryCode
    self.names = names
  }
  public func encode(with coder: NSCoder) {
    coder.encode(countryCode, forKey: "countryCode")
    coder.encode(names, forKey: "names")
  }
  public required convenience init?(coder: NSCoder) {
    let countryCode = coder.decodeObject(forKey: "countryCode") as! String
    let names = coder.decodeObject(forKey: "names") as! Names
    self.init(countryCode: countryCode, names: names)
  }
}

class Names: NSObject, Decodable, NSCoding {
  let name: Name
  enum CodingKeys: String, CodingKey {
    case name = "Name"
  }
  init(name: Name) {
    self.name = name
  }
  public func encode(with coder: NSCoder) {
    coder.encode(name, forKey: "name")
  }
  public required convenience init?(coder: NSCoder) {
    let name = coder.decodeObject(forKey: "name") as! Name
    self.init(name: name)
  }
}
class Name: NSObject, Decodable, NSCoding {
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
  public func encode(with coder: NSCoder) {
    coder.encode(languageCode, forKey: "languageCode")
    coder.encode(empty, forKey: "empty")
  }
  public required convenience init?(coder: NSCoder) {
    let languageCode = coder.decodeObject(forKey: "languageCode") as! String
    let empty = coder.decodeObject(forKey: "empty") as! String
    self.init(languageCode: languageCode, empty: empty)
  }
}
