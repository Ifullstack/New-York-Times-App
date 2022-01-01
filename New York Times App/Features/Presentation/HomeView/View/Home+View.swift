//
//  ViewController.swift
//  New York Times App
//
//  Created by Cane Allesta on 28/12/21.
//

import UIKit

class HomeViewController: BaseViewController<MainCoordinator> {
    
    private var postsView: PostsView = {
        let postsView = PostsView(frame: .zero)
        postsView.translatesAutoresizingMaskIntoConstraints = false
        
        return postsView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Setup View
extension HomeViewController {
    private func setupView() {
        setupNavigationBar()
        view.addSubview(postsView)
        setupPostsView()
        
        
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        DispatchQueue.main.async {
            let filterButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease"), style: .plain, target: self, action: #selector(self.filterButtonTapped))
            self.navigationItem.rightBarButtonItem = filterButton
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.title = "Featured"
        }
    }
    
    private func setupPostsView() {
        DispatchQueue.main.async {
            self.postsView.configureView(from: [
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
            ])
        }
       
    }
}

// MARK: - User Actions
extension HomeViewController {
    @objc func filterButtonTapped() {
        coordinator?.goToFilterView()
    }
}

// MARK: - Constraints
extension HomeViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            postsView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            postsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            postsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            postsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
