//
//  Filter+View.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit

class FilterViewController: BaseViewController<MainCoordinator> {
    
    var viewModel: FilterViewModel?
    
    private(set) var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = false
        scrollView.bounces = false
        
        return scrollView
    }()
    
    private(set) var topicLabelView: LabelView = {
        let topicLabelView = LabelView(frame: .zero)
        topicLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        return topicLabelView
    }()
    
    private(set) var postTypeFilterView: PostFiltersView = {
        let postTypeFilterView = PostFiltersView(frame: .zero)
        postTypeFilterView.translatesAutoresizingMaskIntoConstraints = false
        
        return postTypeFilterView
    }()
    
    private(set) var mostSharedLabelView: LabelView = {
        let mostSharedLabelView = LabelView(frame: .zero)
        mostSharedLabelView.translatesAutoresizingMaskIntoConstraints = false
        mostSharedLabelView.isHidden = true
        
        return mostSharedLabelView
    }()
    
    private(set) var mostSharedFiltersView: MostSharedFiltersView = {
        let mostSharedFiltersView = MostSharedFiltersView(frame: .zero)
        mostSharedFiltersView.translatesAutoresizingMaskIntoConstraints = false
        mostSharedFiltersView.isHidden = true
        
        return mostSharedFiltersView
    }()
    
    private(set) var periodLabelView: LabelView = {
        let periodLabelView = LabelView(frame: .zero)
        periodLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        return periodLabelView
    }()
    
    private(set) var periodFilterView: PostFiltersView = {
        let periodFilterView = PostFiltersView(frame: .zero)
        periodFilterView.translatesAutoresizingMaskIntoConstraints = false
        
        return periodFilterView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        setupView()
        setupBinding()
    }
}

// MARK: - Setup Bindings
extension FilterViewController {
    private func setupBinding() {
        viewModel?.spinnerStatus.bind(listener: { status in
            guard let status = status else { return }
            switch status {
                case .start:
                    self.showSpinner(onView: self.view)
                case .stop:
                    self.removeSpinner()
            }
        })
        
        viewModel?.error.bind(listener: {  error in
            guard let _ = error else { return }
            self.showErrorAlert()
        })
        
        viewModel?.postsPeriodFiltersModel.bind(listener: {  model in
            guard let model = model else { return }
            
            self.setupPeriodLabelView()
            self.setupPeriodFilterView(from: model)
        })
        
        viewModel?.postsTypeFiltersModel.bind(listener: {  model in
            guard let model = model else { return }
            
            self.setupTopicLabelView()
            self.setupPostTypeFilterView(from: model)
        })
        
        viewModel?.mostSharedFiltersModel.bind(listener: {  model in
            guard let model = model else { return }
            
            self.setupMostSharedLabelView()
            self.setupMostSharedFiltersView(from: model)
        })
        
        viewModel?.isMostSharedFilterSelected.bind(listener: { isMostSharedFilterSelected in
            guard let _ = isMostSharedFilterSelected else { return }
            // I think NYC API it only uses facebook as shared type, so I am not using this feature
            // self.toggleMostSharedFilters(isMostSharedFilterSelected: isMostSharedFilterSelected)
        })
    }
}

// MARK: - Setup View
extension FilterViewController {
    private func setupView() {
        setupNavigationBar()
        setupScrollView()
    }
    
    private func setupNavigationBar() {
        DispatchQueue.main.async {
            self.title = "Filters"
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonTapped))
        }
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        setupScrollViewConstraints()
    }
    
    private func setupPeriodLabelView() {
        scrollView.addSubview(periodLabelView)
        periodLabelView.configureView(with: "Period",
                                      and: UIFont.systemFont(ofSize: 17, weight: .heavy))
        
        setupPeriodLabelViewConstraints()
    }
    
    private func setupPeriodFilterView(from models: [PostFiltersModel]) {
        scrollView.addSubview(periodFilterView)
        
        
        periodFilterView.configureView(from: models)
        setupPeriodFilterViewConstraint()
        periodFilterView.delegate = viewModel
    }
    
    private func setupTopicLabelView() {
        scrollView.addSubview(topicLabelView)
        topicLabelView.configureView(with: "Post Type",
                                     and: UIFont.systemFont(ofSize: 17, weight: .heavy))
        
        setupTopicLabelViewConstraints()
    }
    
    private func setupPostTypeFilterView(from models: [PostFiltersModel]) {
        scrollView.addSubview(postTypeFilterView)
        
        
        postTypeFilterView.configureView(from: models)
        postTypeFilterView.delegate = viewModel
        setupPostTypeFilterViewConstraint()
    }
    
    private func setupMostSharedLabelView() {
        scrollView.addSubview(mostSharedLabelView)
        mostSharedLabelView.configureView(with: "Most Shared Options",
                                          and: UIFont.systemFont(ofSize: 17, weight: .heavy))
        
        setupMostSharedLabelViewConstraints()
    }
    
    private func setupMostSharedFiltersView(from models: [PostFiltersModel]) {
        scrollView.addSubview(mostSharedFiltersView)
        mostSharedFiltersView.configureView(from: models)
        mostSharedFiltersView.delegate = viewModel
        setupPeriodFiltersViewConstraint()
    }
}

// MARK: - User Actions
extension FilterViewController {
    @objc private func doneButtonTapped() {
        viewModel?.doneButtonTapped()
        coordinator?.popView()
    }
    
    private func toggleMostSharedFilters(isMostSharedFilterSelected: Bool) {
        DispatchQueue.main.async {
            self.mostSharedLabelView.isHidden = !isMostSharedFilterSelected
            self.mostSharedFiltersView.isHidden = !isMostSharedFilterSelected
        }
    }
}


