//
//  TheInternet.swift
//  qlh-ios
//
//  Created by Daniel Avram on 25/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

class TheInternet {
    private(set) var session: URLSession
    private var onCompletion: ((Data?, URLResponse?, Error?) -> Void)?

    init(configuration _: URLSessionConfiguration = URLSessionConfiguration()) {
        session = URLSession(configuration: .default)
    }

    func makeRequest(_: RequestType, endpoint: Endpoint, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        onCompletion = completion
        let request = URLRequest(url: endpoint.url)
        session.dataTask(with: request, completionHandler: onFinished(data:response:error:)).resume()
    }

    private func onFinished(data: Data?, response: URLResponse?, error: Error?) {
        DispatchQueue.main.async {
            self.onCompletion?(data, response, error)
        }
    }
}

enum RequestType {
    case get
    case post(Codable)
}

enum Endpoint {
    case orders(String, Int?)
    case menu

    var url: URL {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "us-central1-quicklunch-scraper.cloudfunctions.net"

        switch self {
        case let .orders(user, week):
            urlComponent.path = "/getUserOrders"
            let userParameter = URLQueryItem(name: "user", value: user)
            let weekParameter = URLQueryItem(name: "week", value: week?.stringValue)
            urlComponent.queryItems = [userParameter, weekParameter]
        case .menu:
            urlComponent.path = "/menu"
        }

        return urlComponent.url!
    }
}
