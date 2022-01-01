//
//  Base+View.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit

class BaseViewController<CoordinatorType>: UIViewController {
    var coordinator: CoordinatorType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Call remove child coordinator method here
    }
}
