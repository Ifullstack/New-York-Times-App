//
//  Filter+View.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit

final class FilterViewController: BaseViewController<MainCoordinator> {
    
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
        
        return mostSharedLabelView
    }()
    
    private(set) var mostSharedFiltersView: MostSharedFiltersView = {
        let mostSharedFiltersView = MostSharedFiltersView(frame: .zero)
        mostSharedFiltersView.translatesAutoresizingMaskIntoConstraints = false
        
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
        setupView()
    }
}

// MARK: - Setup View
extension FilterViewController {
    private func setupView() {
        setupNavigationBar()
        setupScrollView()
        setupTopicLabelView()
        setupPostTypeFilterView()
        setupMostSharedLabelView()
        setupMostSharedFiltersView()
        setupPeriodLabelView()
        setupPeriodFilterView()
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
    
    private func setupTopicLabelView() {
        scrollView.addSubview(topicLabelView)
        topicLabelView.configureView(with: "Post Type",
                                and: UIFont.systemFont(ofSize: 17, weight: .heavy))
        
        setupTopicLabelViewConstraints()
    }
    
    private func setupPostTypeFilterView() {
        scrollView.addSubview(postTypeFilterView)
        var models = [
            PostFiltersModel(filterName: "Most Mailed", filterTag: 1),
            PostFiltersModel(filterName: "Most Shared", filterTag: 2),
            PostFiltersModel(filterName: "Most Viewed", filterTag: 3)
        ]
        
        postTypeFilterView.configureView(from: models)
        setupPostTypeFilterViewConstraint()
    }
    
    private func setupMostSharedLabelView() {
        scrollView.addSubview(mostSharedLabelView)
        mostSharedLabelView.configureView(with: "Most Shared Options",
                                and: UIFont.systemFont(ofSize: 17, weight: .heavy))
        
        setupMostSharedLabelViewConstraints()
    }
    
    private func setupMostSharedFiltersView() {
        scrollView.addSubview(mostSharedFiltersView)
        let models = [
            PostFiltersModel(filterName: "Facebook", filterTag: 1),
            PostFiltersModel(filterName: "Twitter", filterTag: 2)
        ]
        
        mostSharedFiltersView.configureView(from: models)
        setupPeriodFiltersViewConstraint()
    }
    
    private func setupPeriodLabelView() {
        scrollView.addSubview(periodLabelView)
        periodLabelView.configureView(with: "Period",
                                and: UIFont.systemFont(ofSize: 17, weight: .heavy))
        
        setupPeriodLabelViewConstraints()
    }
    
    private func setupPeriodFilterView() {
        scrollView.addSubview(periodFilterView)
        let models = [
            PostFiltersModel(filterName: "1 día", filterTag: 1),
            PostFiltersModel(filterName: "7 días", filterTag: 2),
            PostFiltersModel(filterName: "30 días", filterTag: 3)
        ]
        
        periodFilterView.configureView(from: models)
        setupPeriodFilterViewConstraint()
    }
}

// MARK: - User Actions
extension FilterViewController {
    @objc func doneButtonTapped() {
        debugPrint("hey hey")
    }
}


