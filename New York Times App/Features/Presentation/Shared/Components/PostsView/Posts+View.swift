//
//  Posts+View.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit

extension PostsView {
    private enum Cells {
        static let postsCellId = "postCell"
    }
}

class PostsView: UIView {
    
    var delegate: PostsViewProtocol?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private var postsModel: [PostsModel]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: View lifeCycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: Setup
    private func setupView() {    
        addSubview(tableView)
    
        tableView.register(PostViewCell.self, forCellReuseIdentifier: Cells.postsCellId)
        tableView.backgroundColor = .clear
        tableView.sectionIndexBackgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.alwaysBounceVertical = false
        tableView.alwaysBounceHorizontal = false
        tableView.allowsSelection = false
       
        setupConstraints()
    }
}

// MARK: - Public Methods
extension PostsView {
    func configureView(from model: [PostsModel]) {
        postsModel = model
    }
}

// MARK: - Delegates
extension PostsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.postsCellId) as? PostViewCell,
              let model = postsModel?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.delegate = delegate
        cell.backgroundColor = .clear
        cell.configureCell(from: model)
        return cell
    }
    
    // TODO: Mejorar este height estático y si no me gusta cambiar a una collection
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(300)
    }
}

// MARK: - Constraints
extension PostsView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
