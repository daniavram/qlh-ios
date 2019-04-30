//
//  ListItemCollection.swift
//  qlh-ios
//
//  Created by Daniel Avram on 30/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

struct ListItemCollection {
    typealias DictionaryType = [Day: [ListItem]]

    private var listItems = DictionaryType()

    subscript(day: DictionaryType.Key) -> DictionaryType.Value {
        get { return listItems[day] ?? [] }
        set { listItems[day] = newValue }
    }

    init(items: DictionaryType) {
        listItems = items
    }

    static func from(data: Data?) -> ListItemCollection {
        var collection = ListItemCollection()

        guard let data = data,
            let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
            let daysDict = dict["days"] as? [String: [String: Any]] else { return collection }

        daysDict.forEach { daysKey, dayDict in
            guard let day = Day(rawValue: daysKey) else { return }
            let dailyMenus = dayDict.compactMapValues { ListItem(jsonValue: $0) }
            let sorted = Array(dailyMenus.values).sorted(by: <)
            collection.listItems[day] = sorted
        }

        return collection
    }
}

extension ListItemCollection: Collection {
    typealias Index = DictionaryType.Index
    typealias Element = DictionaryType.Element

    var startIndex: Index { return listItems.startIndex }
    var endIndex: Index { return listItems.endIndex }

    subscript(index: Index) -> Element { return listItems[index] }

    func index(after i: Index) -> Index {
        return listItems.index(after: i)
    }
}

extension ListItemCollection: ExpressibleByDictionaryLiteral {
    typealias Key = Day
    typealias Value = [ListItem]

    init(dictionaryLiteral elements: (Day, [ListItem])...) {
        for (day, itemsForDay) in elements {
            listItems[day] = itemsForDay
        }
    }
}

extension ListItemCollection: Fetchable {}
