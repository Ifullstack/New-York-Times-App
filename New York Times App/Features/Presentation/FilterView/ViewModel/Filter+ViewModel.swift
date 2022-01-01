//
//  Filter+ViewModel.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import Foundation

protocol FilterViewModelInput {
    func viewDidLoad()
}

protocol FilterViewModelOutput {
    var postsModel: Box<[PostsModel]?> { get }
}

protocol FilterViewModel: FilterViewModelInput, FilterViewModelOutput {}

class DefaultFilterViewModel: FilterViewModel {
    var postsModel: Box<[PostsModel]?> = Box(nil)
    
    func viewDidLoad() {
       // fetchPosts()
    }
}
