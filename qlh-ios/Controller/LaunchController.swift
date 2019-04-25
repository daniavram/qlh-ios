//
//  LaunchController.swift
//  qlh-ios
//
//  Created by Daniel Avram on 13/04/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class LaunchController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let list = ListController(color: .listGradient1)
        let navigation = UINavigationController(rootViewController: list)
        present(navigation, animated: true, completion: nil)
    }
}
