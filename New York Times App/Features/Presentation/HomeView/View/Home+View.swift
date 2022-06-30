//
//  ViewController.swift
//  New York Times App
//
//  Created by Cane Allesta on 28/12/21.
//

import UIKit
import RxSwift

class HomeViewController: BaseViewController<MainCoordinator> {
    
    var viewModel: HomeViewModel?
    
    private var disposeBag: DisposeBag = DisposeBag()
    
    private var postsView: PostsView = {
        let postsView = PostsView(frame: .zero)
        postsView.translatesAutoresizingMaskIntoConstraints = false
        
        return postsView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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
        viewModel?.sharedViewModel?.viewState.observe(on: MainScheduler.instance)
                                             .subscribe(onNext: { state in
                                                 guard let state = state else { return }
                                                 self.viewStateHandler(state: state)
                                             })
                                             .disposed(by: disposeBag)
                                             
    }
}

// MARK: - Private Methods
extension HomeViewController {
    private func viewStateHandler(state: SharedViewStates) {
        switch state {
            case .loading(let status):
                guard let status = status else { return }
                self.spinnerStatusHandler(status: status)
            case .errorState(let error):
                guard let _ = error else { return }
                self.showErrorAlert()
            case .postsModelsChanged(let models):
                guard let models = models else { return }
                self.setupPostsView(from: models)
        }
    }
    
    private func spinnerStatusHandler(status: SpinnerStatus) {
        switch status {
            case .start:
                self.showSpinner(onView: self.view)
            case .stop:
                self.removeSpinner()
        }
    }
}

// MARK: - Setup View
extension HomeViewController {
    private func setupView() {
        view.addSubview(postsView)
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        DispatchQueue.main.async {
            let filterButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease"), style: .plain, target: self, action: #selector(self.filterButtonTapped))
            self.navigationItem.rightBarButtonItem = filterButton
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.title = "New York Times"
        }
    }
    
    private func setupPostsView(from models: [PostsModel]) {
        DispatchQueue.main.async {
            self.postsView.delegate = self
            self.postsView.configureView(from: models)
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

// MARK: - Constraints
extension HomeViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            postsView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            postsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            postsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            postsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
