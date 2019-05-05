//
//  DaysView.swift
//  qlh-ios
//
//  Created by Daniel Avram on 05/05/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class DaysView: UIView {
    var delegate: DaysViewDelegate?

    private var centeredFlowLayout: CenteredCollectionViewFlowLayout!

    convenience init(size: CGSize) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        _ = constraint(to: size)
        centeredFlowLayout = CenteredCollectionViewFlowLayout()
        centeredFlowLayout.itemSize = size
        let collectionView = UICollectionView(centeredCollectionViewFlowLayout: centeredFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DayCell.self, forCellWithReuseIdentifier: DayCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.scrollsToTop = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        _ = addSubview(collectionView, withPadding: .zero)
        collectionView.backgroundColor = .clear
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let currentIndex = centeredFlowLayout.currentCenteredPage,
            let day = Day.withIndex(currentIndex) else { return }
        delegate?.didSelect(day: day)
    }
}

extension DaysView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCell.identifier, for: indexPath) as? DayCell else { return UICollectionViewCell() }
        cell.day = Day.withIndex(indexPath.item)
        return cell
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return Day.allCases.count
    }
}

protocol DaysViewDelegate: class {
    func didSelect(day: Day)
}
