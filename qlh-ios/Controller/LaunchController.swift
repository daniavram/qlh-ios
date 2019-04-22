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
        Application.spinner.start(from: self)
        let list = ListController(color: .red)
        let navigation = UINavigationController(rootViewController: list)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            Application.spinner.stop(from: self)
            self.present(navigation, animated: true, completion: nil)
        }
    }
}
