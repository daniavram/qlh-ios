//
//  ListCell.swift
//  qlh-ios
//
//  Created by Daniel Avram on 14/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    static let identifier = String(describing: ListCell.self)
    private var container: UIView!
    var props: Props = Props()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func initialize() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = props.backgroundColor
        container.clipsToBounds = true
        container.layer.cornerRadius = props.cornerRadius
        contentView.addSubview(container, withPadding: props.insets)
    }

    override func setSelected(_: Bool, animated _: Bool) {
        // do nothing or it will mess up with the color animation from setHighlighted
    }

    override func setHighlighted(_ highlighted: Bool, animated _: Bool) {
        // don't call super or it will mess up with the color animation
        UIView.animate(withDuration: 0.2) {
            self.container.backgroundColor = highlighted ? self.props.highlightColor : self.props.backgroundColor
        }
    }
}

extension ListCell {
    struct Props {
        var cornerRadius: CGFloat = 8
        var insets: UIEdgeInsets = .init(top: 0, left: 6, bottom: 12, right: 6)
        var backgroundColor: UIColor = .white
        var highlightColor: UIColor = UIColor.gray.lighten(by: 70)
    }
}
