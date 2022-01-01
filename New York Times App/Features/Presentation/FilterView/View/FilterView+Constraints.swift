//
//  FilterView+Constraints.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit

// MARK: - Constraints
extension FilterViewController {
    
    func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupTopicLabelViewConstraints() {
        NSLayoutConstraint.activate([
            topicLabelView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            topicLabelView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16)
        ])
    }
    
    func setupPostTypeFilterViewConstraint() {
        // TODO: Improve this constraints without static height
        NSLayoutConstraint.activate([
            postTypeFilterView.topAnchor.constraint(equalTo: topicLabelView.bottomAnchor, constant: 20),
            postTypeFilterView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            postTypeFilterView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            postTypeFilterView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            postTypeFilterView.heightAnchor.constraint(equalToConstant: CGFloat(180))
        ])
    }
    
    func setupMostSharedLabelViewConstraints() {
        NSLayoutConstraint.activate([
            mostSharedLabelView.topAnchor.constraint(equalTo: postTypeFilterView.bottomAnchor, constant: 20),
            mostSharedLabelView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16)
        ])
    }
    
    func setupPeriodFiltersViewConstraint() {
        // TODO: Improve this constraints without static height
        NSLayoutConstraint.activate([
            mostSharedFiltersView.topAnchor.constraint(equalTo: mostSharedLabelView.bottomAnchor, constant: 20),
            mostSharedFiltersView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            mostSharedFiltersView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mostSharedFiltersView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            mostSharedFiltersView.heightAnchor.constraint(equalToConstant: CGFloat(140))
        ])
    }
    
    func setupPeriodLabelViewConstraints() {
        NSLayoutConstraint.activate([
            periodLabelView.topAnchor.constraint(equalTo: mostSharedFiltersView.bottomAnchor, constant: 20),
            periodLabelView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16)
        ])
    }
    
    func setupPeriodFilterViewConstraint() {
        // TODO: Improve this constraints without static height
        NSLayoutConstraint.activate([
            periodFilterView.topAnchor.constraint(equalTo: periodLabelView.bottomAnchor, constant: 20),
            periodFilterView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            periodFilterView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            periodFilterView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.9),
            periodFilterView.heightAnchor.constraint(equalToConstant: CGFloat(180))
        ])
    }
}
