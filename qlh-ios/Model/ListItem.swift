//
//  ListItem.swift
//  qlh-ios
//
//  Created by Daniel Avram on 25/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

class ListItem: Fetchable, Codable, ListViewModel {
    var course: Course?
    var menu: Menu?

    init() {
        course = Course()
        menu = Menu()
    }

    var props: ListViewProps {
        let props = ListViewProps(title: menu?.title,
                                  price: course?.price,
                                  subtitle: course?.name)
        return props
    }
}
