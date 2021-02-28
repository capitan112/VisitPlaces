//
//  NetworkDataFetcher.swift
//  VisitPlace
//
//  Created by Oleksiy Chebotarov on 26/02/2021.
//

import Foundation

enum ConversionFailure: Error {
    case invalidData
    case missingData
    case responceError
}

protocol NetworkDataFetcherProtocol {
    func fetchArticles(by ulr: String, completion: @escaping (Result<[String: [Article]], Error>) -> Void)
    func fetchGenericJSONData(urlString: String, response: @escaping (Result<[String: [Article]], Error>) -> Void)
}

class NetworkDataFetcher: NetworkDataFetcherProtocol {
    var networking: NetworkProtocol

    init(networking: NetworkProtocol = NetworkService()) {
        self.networking = networking
    }

    func fetchArticles(by ulr: String, completion: @escaping (Result<[String: [Article]], Error>) -> Void) {
        fetchGenericJSONData(urlString: ulr, response: completion)
    }

    func fetchGenericJSONData(urlString: String, response: @escaping (Result<[String: [Article]], Error>) -> Void) {
        networking.request(urlString: urlString) { dataResponse in
            guard let data = try? dataResponse.get() else {
                response(.failure(ConversionFailure.responceError))
                return
            }

            self.decodeJSON(from: data, completion: response)
        }
    }

    private func decodeJSON(from data: Data?, completion: @escaping (Result<[String: [Article]], Error>) -> Void) {
        guard let data = data else {
            completion(.failure(ConversionFailure.missingData))
            return
        }

        let decoder = JSONDecoder()
        do {
            let result = Result(catching: {
                try decoder.decode([String: [Article]].self, from: data)
            })

            completion(result)
        }
    }
}
