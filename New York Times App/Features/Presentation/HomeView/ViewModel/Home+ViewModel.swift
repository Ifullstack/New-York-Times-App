//
//  Home+ViewModel.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import Foundation

protocol HomeViewModelInput {
    func viewDidLoad()
    var sharedViewModel: SharedViewModel? { get }
}

protocol HomeViewModelOutput {}

protocol HomeViewModel: HomeViewModelInput, HomeViewModelOutput {}

class DefaultHomeViewModel: HomeViewModel {
    
    // Exposed Properties
    var sharedViewModel: SharedViewModel?
    
    init(sharedViewModel: SharedViewModel = DefaultSharedViewModel()) {
        self.sharedViewModel = sharedViewModel
    }
    
    func viewDidLoad() {
        sharedViewModel?.fetchPosts(parameters: FetchPostsUseCaseParameters(postType: sharedViewModel?.postTypeSelected ?? "",
                                                                            period: sharedViewModel?.periodSelected ?? "",
                                                                            sharedType: sharedViewModel?.sharedTypeSelected ?? ""))
    }
}


