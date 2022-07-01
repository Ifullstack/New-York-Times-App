//
//  PostDetail+View.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit
import WebKit

class PostDetailViewController: BaseViewController<MainCoordinator> {
    
    var sharedViewModel: SharedViewModel?
    
    private var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
}

// MARK: - Setup View
extension PostDetailViewController {
    private func setupNavigationBar() {
        DispatchQueue.main.async {
             self.title = self.sharedViewModel?.postModelSelected?.title
        }
    }
    
    private func setupView() {
        configureWebView()
        view.addSubview(webView)
        setConstraints()
    }
    
    private func configureWebView() {
        guard let sharedViewModel = sharedViewModel,
              let postModelSelected = sharedViewModel.postModelSelected,
              let postUrl = postModelSelected.postUrl,
              let url = URL(string: postUrl) else {
                  self.showErrorAlert()
            return
        }

        let configuration = WKWebViewConfiguration()
        webView = WKWebView(frame: view.frame, configuration: configuration)
        webView.scrollView.bounces = false
        self.navigationController?.navigationBar.isTranslucent = false
        webView.load(URLRequest(url: url))
    }
}

// MARK: - Setup Constraints
extension PostDetailViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
