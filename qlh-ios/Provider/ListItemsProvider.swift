//
//  ListItemsProvider.swift
//  qlh-ios
//
//  Created by Daniel Avram on 25/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

class ListItemsProvider<T: ListItemsDelegate> {
    weak var delegate: T?

    init(delegate: T) {
        self.delegate = delegate
    }

    func fetch() {
        delegate?.didStartFetch()

        TheInternet().makeRequest(.get, endpoint: .orders("dani", 13)) { data, _, _ in
            self.delegate?.didEndFetch()

            if let data = data {
                let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                debugPrint(dict)
            }

            self.delegate?.didFetch([])
        }
    }
}
