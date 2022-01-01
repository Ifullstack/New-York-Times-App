//
//  Home+ViewModel.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import Foundation

protocol HomeViewModelInput {
    func viewDidLoad()
}

protocol HomeViewModelOutput {
    var postsModel: Box<[PostsModel]?> { get }
}

protocol HomeViewModel: HomeViewModelInput, HomeViewModelOutput {}

class DefaultHomeViewModel: HomeViewModel {
    var postsModel: Box<[PostsModel]?> = Box(nil)
    
    func viewDidLoad() {
        fetchPosts()
    }
}

// MARK: - Private Methods
extension DefaultHomeViewModel {
    func fetchPosts() {
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
    }
}
