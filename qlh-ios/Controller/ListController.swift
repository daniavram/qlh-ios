//
//  ListController.swift
//  qlh-ios
//
//  Created by Daniel Avram on 14/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class ListController: UIViewController, UITableViewDelegate, UITableViewDataSource, CAAnimationDelegate, AnimatableGradient {
    var isLoopable: Bool = true
    var gradient: CAGradientLayer = CAGradientLayer()
    var gradientContainer: UIView!
    var stepDuration: CFTimeInterval = 6
    var colors: CircularList<GradientColor> = GradientColor.allForList
    var currentPoint: GradientPoint = .bottom
    var pointTick: CGFloat = 0

    private var tableView: UITableView!

    convenience init(color: UIColor) {
        self.init()
        tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.identifier)
        tableView.rowHeight = 80
        tableView.sectionHeaderHeight = .leastNonzeroMagnitude
        tableView.sectionFooterHeight = .leastNonzeroMagnitude
        tableView.separatorStyle = .none
        tableView.backgroundColor = color
        tableView.backgroundView = UIView()
        _ = view.addSubview(tableView, withPadding: .zero)
        gradientContainer = UIView(frame: view.frame)
        gradientContainer.translatesAutoresizingMaskIntoConstraints = false
        _ = tableView.backgroundView?.addSubview(gradientContainer, withPadding: .zero)
        initializeGradient()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animate()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        updateGradient(size: size)
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier,
                                                       for: indexPath) as? ListCell else { return UITableViewCell() }
        cell.props.insets.top = indexPath.row == 0 ? 12 : 6
        cell.props.insets.bottom = indexPath.row == 9 ? 12 : 6
        return cell
    }

    func tableView(_: UITableView, heightForHeaderInSection _: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }

    func tableView(_: UITableView, heightForFooterInSection _: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func animationDidStop(_: CAAnimation, finished flag: Bool) {
        guard isLoopable, flag else { return }
        currentPoint = currentPoint == .bottom ? .top : .bottom
        animate()
    }
}
