//
//  Base+View.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit

class BaseViewController<CoordinatorType>: UIViewController {
    var coordinator: CoordinatorType?
    private var vSpinner : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.colorCatalog(name: .primaryBackground)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Call remove child coordinator method here
    }
}

// MARK: - Spinner
extension BaseViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
}

// MARK: - Alert Error
extension BaseViewController {
    func showErrorAlert() {
        let alertCtrl = UIAlertController(title: "Error during the process", message: "An unexpected error has occurred", preferredStyle: .alert)
        alertCtrl.addAction(UIAlertAction(title: "Dismiss", style: .destructive))
        
        self.present(alertCtrl, animated: true, completion: nil)
    }
}
