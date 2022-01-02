//
//  PeriodTypeFilter+View.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit

extension MostSharedFiltersView {
    private enum Cells {
        static let checkboxFiltersCell = "CheckboxFiltersCell"
    }
}

class MostSharedFiltersView: UIView {
    
    var delegate: CheckBoxFiltersCellProtocol?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private var periodFilterCellModel: [PostFiltersModel]? {
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
    
        tableView.register(CheckBoxFiltersCell.self, forCellReuseIdentifier: Cells.checkboxFiltersCell)
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
extension MostSharedFiltersView {
    func configureView(from model: [PostFiltersModel]) {
        periodFilterCellModel = model
    }
}

// MARK: - Delegates
extension MostSharedFiltersView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return periodFilterCellModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.checkboxFiltersCell) as? CheckBoxFiltersCell,
              let model = periodFilterCellModel?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.configureCell(from: model)
        cell.delegate = delegate
        return cell
    }
}
