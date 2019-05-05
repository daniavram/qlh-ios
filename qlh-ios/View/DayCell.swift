//
//  DayCell.swift
//  qlh-ios
//
//  Created by Daniel Avram on 05/05/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class DayCell: UICollectionViewCell, NameIdentifiable {
    private var label: UILabel!

    var day: Day? {
        didSet {
            label.text = day?.displayValue.uppercased()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func initialize() {
        label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        _ = addSubview(label, withPadding: .zero)
    }
}
