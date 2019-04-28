//
//  ListViewModel.swift
//  qlh-ios
//
//  Created by Daniel Avram on 28/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

protocol ListViewModel {
    var props: ListViewProps { get }
}

struct ListViewProps {
    var title: String?
    var price: String?
    var subtitle: String?
}
