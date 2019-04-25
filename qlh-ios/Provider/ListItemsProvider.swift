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

        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.delegate?.didEndFetch()

            let stubs: [ListItem] = [
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
                ListItem(),
            ]

            self.delegate?.didFetch(stubs)
        }
    }
}
