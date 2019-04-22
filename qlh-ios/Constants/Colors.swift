//
//  Colors.swift
//  qlh-ios
//
//  Created by Daniel Avram on 13/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

// MARK: - Color names

private extension UIColor {
    static var turquoise = UIColor(hexString: "#40E0D0")
    static var pizazz = UIColor(hexString: "#FF8C00")
    static var rose = UIColor(hexString: "#FF0080")
    static var green = UIColor(hexString: "#5EBD3E")
    static var yellow = UIColor(hexString: "#FFB900")
    static var orange = UIColor(hexString: "#F78200")
    static var red = UIColor(hexString: "#E23838")
    static var purple = UIColor(hexString: "#973999")
    static var blue = UIColor(hexString: "#009CDF")
}

// MARK: - Color values

extension UIColor {
    static var gradient1: UIColor = .turquoise
    static var gradient2: UIColor = .pizazz
    static var gradient3: UIColor = .rose
    static var rainbow1: UIColor = .green
    static var rainbow2: UIColor = .yellow
    static var rainbow3: UIColor = .orange
    static var rainbow4: UIColor = .red
    static var rainbow5: UIColor = .purple
    static var rainbow6: UIColor = .blue
}

// MARK: - Gradient color values

extension GradientColor {
    static var one = GradientColor(primary: .gradient1, secondary: .gradient2)
    static var two = GradientColor(primary: .gradient2, secondary: .gradient3)
    static var three = GradientColor(primary: .gradient3, secondary: .gradient1)
    static var rainbow1 = GradientColor(primary: .rainbow1, secondary: .rainbow2)
    static var rainbow2 = GradientColor(primary: .rainbow2, secondary: .rainbow3)
    static var rainbow3 = GradientColor(primary: .rainbow3, secondary: .rainbow4)
    static var rainbow4 = GradientColor(primary: .rainbow4, secondary: .rainbow5)
    static var rainbow5 = GradientColor(primary: .rainbow5, secondary: .rainbow6)
    static var rainbow6 = GradientColor(primary: .rainbow6, secondary: .rainbow1)
    static var all = CircularList<GradientColor>(elements: [.rainbow1, .rainbow2, .rainbow3, .rainbow4, .rainbow5, .rainbow6])
}
