//
//  ListItem.swift
//  qlh-ios
//
//  Created by Daniel Avram on 25/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

class ListItem: Codable, ListViewModel, Comparable {
    var course: Course?
    var menu: Menu?

    init?(jsonValue: Any) {
        let dictData = try? JSONSerialization.data(withJSONObject: jsonValue, options: [])
        let item = decoded(from: dictData)
        course = item?.course
        menu = item?.menu
    }

    var props: ListViewProps {
        let props = ListViewProps(title: menu?.title,
                                  price: course?.price,
                                  subtitle: course?.name)
        return props
    }

    static func < (lhs: ListItem, rhs: ListItem) -> Bool {
        guard let lhsMenuId = lhs.menu?.id, let rhsMenuId = rhs.menu?.id else { return false }
        return lhsMenuId < rhsMenuId
    }

    static func == (lhs: ListItem, rhs: ListItem) -> Bool {
        guard let lhsMenuId = lhs.menu?.id, let rhsMenuId = rhs.menu?.id else { return false }
        return lhsMenuId == rhsMenuId
    }
}
