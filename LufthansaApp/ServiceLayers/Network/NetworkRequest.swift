//
//  NetworkRequest.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 10.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

enum Models: String {
    case countries
    case cities
    case airports
}

protocol NetworkRequestProtocol {
    func fetchJSONData<Elements: Decodable>(
                                            request witchModel: Models,
                                            model type: Elements.Type,
                                             complition: @escaping (Result<Elements?, Error>) -> Void)
}

class NetworkRequest: NetworkRequestProtocol {
    func fetchJSONData<Elements: Decodable>(
                                            request witchModel: Models,
                                            model type: Elements.Type,
                                             complition: @escaping (Result<Elements?, Error>) -> Void) {
        guard
            let url =
            URL(string: "https://api.lufthansa.com/v1/mds-references/\(witchModel.rawValue)/?lang=EN&offset=0")
            else { return }
        var request = URLRequest(url: url)
        request.addValue(
                        "application/json",
                        forHTTPHeaderField: "Accept"
        )
        request.addValue(
                        "Bearer uux6vftf6ww48gn2xq3cen9d",
                        forHTTPHeaderField: "Authorization"
        )
        request.addValue(
                        "84.52.73.196",
                        forHTTPHeaderField: "X-Originating-IP"
        )
        let session = URLSession.shared
        session.dataTask(with: request) { (data, _, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            do {
                let decodedData = try decoder.decode(type.self, from: data)
                complition(.success(decodedData))
            } catch {
                complition(.failure(error))
            }
        }.resume()
    }
}
