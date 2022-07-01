//
//  ViewController.swift
//  New York Times App
//
//  Created by Cane Allesta on 28/12/21.
//

import UIKit
import Combine
import SwiftUI

class HomeViewController: BaseViewController<MainCoordinator> {
    
    var viewModel: HomeViewModel?
    private var cancellables = Set<AnyCancellable>()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        viewModel?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
}

// MARK: - Setup Binding
extension HomeViewController {
    private func setupBinding() {
        viewModel?.sharedViewModel?.postsModelPublisher
                                  .receive(on: RunLoop.main)
                                  .sink(receiveValue: { model in
                                        guard let model = model else { return }
                                        self.setupPostsView(from: model)
                                  }).store(in: &cancellables)
        
        viewModel?.sharedViewModel?.spinnerStatusPublisher
                                  .receive(on: RunLoop.main)
                                  .sink(receiveValue: { status in
                                      guard let status = status else { return }
                                      switch status {
                                          case .start:
                                              self.showSpinner(onView: self.view)
                                          case .stop:
                                              self.removeSpinner()
                                      }
                                  }).store(in: &cancellables)
        

        viewModel?.sharedViewModel?.errorPublisher
                                  .receive(on: RunLoop.main)
                                  .sink(receiveValue: { error in
                                      guard let _ = error else { return }
                                      self.showErrorAlert()
                                  }).store(in: &cancellables)
    }
}

// MARK: - Setup View
extension HomeViewController {
    private func setupNavigationBar() {
        DispatchQueue.main.async {
            let filterButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease"), style: .plain, target: self, action: #selector(self.filterButtonTapped))
            self.navigationItem.rightBarButtonItem = filterButton
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationController?.navigationBar.backgroundColor = UIColor.colorCatalog(name: .primaryBackground)
            self.title = "New York Times"
        }
    }
    
    private func setupPostsView(from models: [PostsModel]) {
        DispatchQueue.main.async {
            let postsView = UIHostingController(rootView: PostsView(delegate: self,
                                                                    postsModel: models))
            postsView.view.frame = self.view.frame
            self.addChild(postsView)
            self.view.addSubview(postsView.view)
        }
    }
}

// MARK: - User Actions
extension HomeViewController: PostsViewProtocol {
    @objc private func filterButtonTapped() {
        guard let sharedViewModel = viewModel?.sharedViewModel else {
            return
        }
        coordinator?.goToFilterView(sharedViewModel: sharedViewModel)
    }
    
    func postTapped(postModelSelected: PostsModel) {
        guard let sharedViewModel = viewModel?.sharedViewModel else {
            return
        }
        sharedViewModel.setPostModelSelected(postModelSelected: postModelSelected)
        coordinator?.goToPostDetailView(sharedViewModel: sharedViewModel)
    }
}
