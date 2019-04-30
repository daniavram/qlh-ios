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

        TheInternet().makeRequest(.get, endpoint: .menu) { data, _, _ in
            self.delegate?.didEndFetch()
            let collection = ListItemCollection.from(data: data)
            self.delegate?.didFetch(collection)
        }
    }
}
