//
//  PostTypeFilter+View.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit

extension PostFiltersView {
    private enum Cells {
        static let radioFiltersCellId = "RadioFiltersCell"
    }
}

class PostFiltersView: UIView {
    
    var delegate: RadioFiltersCellProtocol?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private var radioFilterCellModel: [PostFiltersModel]? {
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
        layer.cornerRadius = 20
        backgroundColor = UIColor.colorCatalog(name: .blurBackGround)
    
        addSubview(tableView)
    
        tableView.register(RadioFiltersCell.self, forCellReuseIdentifier: Cells.radioFiltersCellId)
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.alwaysBounceVertical = false
        tableView.alwaysBounceHorizontal = false
        tableView.isScrollEnabled = false
        
        
        tableView.reloadData()
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Public Methods
extension PostFiltersView {
    func configureView(from model: [PostFiltersModel]) {
        radioFilterCellModel = model
    }
}

// MARK: - Delegates
extension PostFiltersView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return radioFilterCellModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.radioFiltersCellId) as? RadioFiltersCell,
              let model = radioFilterCellModel?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.configureCell(from: model)
        cell.delegate = delegate
        return cell
    }
}


