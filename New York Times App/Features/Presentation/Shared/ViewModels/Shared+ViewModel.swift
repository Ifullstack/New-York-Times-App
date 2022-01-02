//
//  Shared+ViewModel.swift
//  New York Times App
//
//  Created by Cane Allesta on 2/1/22.
//

import Foundation

protocol SharedViewModelInput {
    func fetchPosts()
}

protocol SharedViewModelOutput {
    var postsModel: Box<[PostsModel]?> { get }
    var spinnerStatus: Box<SpinnerStatus?> { get }
    var error: Box<Error?> { get }
}

protocol SharedViewModel: SharedViewModelInput,
                          SharedViewModelOutput {}

class DefaultSharedViewModel: SharedViewModel {
    
    // Bindings
    var postsModel: Box<[PostsModel]?> = Box(nil)
    var spinnerStatus: Box<SpinnerStatus?> = Box(nil)
    var error: Box<Error?> = Box(nil)
}

// MARK: - Public Methods
extension DefaultSharedViewModel {
    func fetchPosts() {
        spinnerStatus.value = .start
        postsModel.value = [
            PostsModel(image: "https://static01.nyt.com/images/2021/12/26/fashion/00Havrilesky-Excerpt/00Havrilesky-Excerpt-mediumThreeByTwo210.jpg",
                       title: "Title",
                       autor: "Autor",
                       section: "Section",
                       publicationDate: "Publication Date"),
            PostsModel(image: "https://static01.nyt.com/images/2021/12/26/fashion/00Havrilesky-Excerpt/00Havrilesky-Excerpt-mediumThreeByTwo210.jpg",
                       title: "Title 2",
                       autor: "Autor 2",
                       section: "Section 2",
                       publicationDate: "Publication Date 2"),
            PostsModel(image: "https://static01.nyt.com/images/2021/12/26/fashion/00Havrilesky-Excerpt/00Havrilesky-Excerpt-mediumThreeByTwo210.jpg",
                       title: "Title",
                       autor: "Autor",
                       section: "Section",
                       publicationDate: "Publication Date"),
            PostsModel(image: "https://static01.nyt.com/images/2021/12/26/fashion/00Havrilesky-Excerpt/00Havrilesky-Excerpt-mediumThreeByTwo210.jpg",
                       title: "Title 2",
                       autor: "Autor 2",
                       section: "Section 2",
                       publicationDate: "Publication Date 2"),
            PostsModel(image: "https://static01.nyt.com/images/2021/12/26/fashion/00Havrilesky-Excerpt/00Havrilesky-Excerpt-mediumThreeByTwo210.jpg",
                       title: "Title",
                       autor: "Autor",
                       section: "Section",
                       publicationDate: "Publication Date"),
            PostsModel(image: "https://static01.nyt.com/images/2021/12/26/fashion/00Havrilesky-Excerpt/00Havrilesky-Excerpt-mediumThreeByTwo210.jpg",
                       title: "Title 2",
                       autor: "Autor 2",
                       section: "Section 2",
                       publicationDate: "Publication Date 2"),
            PostsModel(image: "https://static01.nyt.com/images/2021/12/26/fashion/00Havrilesky-Excerpt/00Havrilesky-Excerpt-mediumThreeByTwo210.jpg",
                       title: "Title",
                       autor: "Autor",
                       section: "Section",
                       publicationDate: "Publication Date"),
            PostsModel(image: "https://static01.nyt.com/images/2021/12/26/fashion/00Havrilesky-Excerpt/00Havrilesky-Excerpt-mediumThreeByTwo210.jpg",
                       title: "Title 2",
                       autor: "Autor 2",
                       section: "Section 2",
                       publicationDate: "Publication Date 2"),
            PostsModel(image: "https://static01.nyt.com/images/2021/12/26/fashion/00Havrilesky-Excerpt/00Havrilesky-Excerpt-mediumThreeByTwo210.jpg",
                       title: "Title",
                       autor: "Autor",
                       section: "Section",
                       publicationDate: "Publication Date"),
            PostsModel(image: "https://static01.nyt.com/images/2021/12/26/fashion/00Havrilesky-Excerpt/00Havrilesky-Excerpt-mediumThreeByTwo210.jpg",
                       title: "Title 2",
                       autor: "Autor 2",
                       section: "Section 2",
                       publicationDate: "Publication Date 2")
        ]
        spinnerStatus.value = .stop
    }
}
