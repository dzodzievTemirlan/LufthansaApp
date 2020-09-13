//
//  NetworkGetToken.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 24.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

protocol NetwrorkGetTokenProtocol {
  func postRequestGetToken( complition: @escaping( _ token: String) -> Void  )
}

class NetworkGetToken: NetwrorkGetTokenProtocol {
  static let shared = NetworkGetToken()
  
  func postRequestGetToken(complition: @escaping( _ token: String) -> Void) {
    guard let url = URL(string: "https://api.lufthansa.com/v1/oauth/token") else { return }
    let requestHeaders: [String:String] = ["Content-Type":"application/x-www-form-urlencoded"]
    var requestBodyComponents = URLComponents()
    requestBodyComponents.queryItems = [URLQueryItem(name: "client_id", value: "myw5rc2bfa3z5hhkkuadmy4n"),
                                        URLQueryItem(name: "client_secret", value: "CNbcxVMvYb"),
                                        URLQueryItem(name: "grant_type", value: "client_credentials")]
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = requestHeaders
    request.httpBody = requestBodyComponents.query?.data(using: .utf8)
    let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
      if error == nil {
        guard let data = data else { return }
        guard let token = self.decodeTokenJson(data: data) else { return }
        complition(token)
      }
    }
    task.resume()
  }
  
  fileprivate func decodeTokenJson(data: Data?) -> String? {
    guard let data = data else { return nil}
    var tokenString = String()
    let decoder = JSONDecoder()
    do {
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let token = try decoder.decode(Token.self, from: data)
      tokenString = token.accessToken
    } catch {
      print(error)
    }
    return tokenString
  }
}
