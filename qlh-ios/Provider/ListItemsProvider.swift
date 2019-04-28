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

        let item1 = ListItem()
        item1.course?.name = "Supa crema de curcan"
        item1.course?.price = "12.4"
        item1.menu?.id = "A1-supe"
        item1.menu?.title = "A1"
        item1.menu?.subtitle = "supe"
        let item2 = ListItem()
        item2.course?.name = "Camembert pane cu orez"
        item2.course?.price = "15.2"
        item2.menu?.id = "D3-paneuri"
        item2.menu?.title = "D3"
        item2.menu?.subtitle = "paneuri"
        let item3 = ListItem()
        item3.course?.name = "Piept de pui cu legume la gratar si sos te usturoi in stil thailandez"
        item3.course?.price = "10"
        item3.menu?.id = "D4M-gratare"
        item3.menu?.title = "D4M"
        item3.menu?.subtitle = "gratare"
        let item4 = ListItem()
        item4.course?.name = "Penne carbonara vegan"
        item4.course?.price = "14.9"
        item4.menu?.id = "D1-paste"
        item4.menu?.title = "D1"
        item4.menu?.subtitle = "paste"
        let item5 = ListItem()
        item5.course?.name = "Cotlet de porc parizian cu cartofi piure"
        item5.course?.price = "29"
        item5.menu?.id = "G4-snitele"
        item5.menu?.title = "G4"
        item5.menu?.subtitle = "snitele"

        let items = [item1, item2, item3, item4, item5]

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.delegate?.didEndFetch()
            self.delegate?.didFetch(items)
        }
    }

//    func fetch() {
//        delegate?.didStartFetch()
//
//        TheInternet().makeRequest(.get, endpoint: .orders("dani", 13)) { data, _, _ in
//            self.delegate?.didEndFetch()
//
//            if let data = data {
//                let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
//                debugPrint(dict)
//            }
//
//            self.delegate?.didFetch([])
//        }
//    }
}
