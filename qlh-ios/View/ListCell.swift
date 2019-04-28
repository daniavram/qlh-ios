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
    private var anchors: UIView.Anchors!
    private var container: UIView!
    private var vStack: UIStackView!
    private var hStack: UIStackView!
    private var titleLabel: UILabel!
    private var priceLabel: UILabel!
    private var subtitleLabel: UILabel!

    var props: Props = Props() {
        didSet {
            updatePaddings()
        }
    }

    var viewModel: ListViewModel? {
        didSet {
            titleLabel.text = viewModel?.props.title
            priceLabel.text = viewModel?.props.price
            subtitleLabel.text = viewModel?.props.subtitle
        }
    }

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
        anchors = contentView.addSubview(container, withPadding: props.insets)
        hStack = UIStackView(frame: .zero)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        vStack = UIStackView(frame: .zero)
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel = UILabel(frame: .zero)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel = UILabel(frame: .zero)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.numberOfLines = 0
        hStack.addArrangedSubview(titleLabel)
        hStack.addArrangedSubview(priceLabel)
        vStack.addArrangedSubview(hStack)
        vStack.addArrangedSubview(subtitleLabel)
        _ = container.addSubview(vStack, withPadding: .all(with: 8))
    }

    private func updatePaddings() {
        anchors.setConstants(to: props.insets)
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
        var insets: UIEdgeInsets = .all(with: 6)
        var backgroundColor: UIColor = .white
        var highlightColor: UIColor = UIColor.gray.lighten(by: 70)
    }
}
