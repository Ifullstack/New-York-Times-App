//
//  CheckBoxFilter+Cell.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit


class CheckBoxFiltersCell: UITableViewCell {
    
    private var containerView: UIView = {
        let containerView = UIView(frame: .zero)
        containerView.translatesAutoresizingMaskIntoConstraints = false
    
        return containerView
    }()
    
    private var labelView: LabelView = {
        let labelView = LabelView(frame: .zero)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        return labelView
    }()
        
    private var radioButton: UIButton = {
        let radioButton = UIButton(frame: .zero)
        radioButton.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
        radioButton.translatesAutoresizingMaskIntoConstraints = false
        radioButton.setImage(UIImage(named: "check_box_off"), for: .normal)
        radioButton.setImage(UIImage(named: "check_box_on"), for: .selected)
        
        return radioButton
    }()
    
    private var lineSeparator: UIView = {
        let lineSeparator = UIView(frame: .zero)
        lineSeparator.translatesAutoresizingMaskIntoConstraints = false
        lineSeparator.backgroundColor = UIColor.colorCatalog(name: .primaryTextColor)
        lineSeparator.layer.opacity = 0.2
        
        return lineSeparator
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods
extension CheckBoxFiltersCell {
    func configureCell(from model: PostFiltersModel) {
        DispatchQueue.main.async {
            self.labelView.configureView(with: model.filterName,
                                    and: UIFont.systemFont(ofSize: 16, weight: .semibold))
            
        }
    }
    
    private func radioButtonSetSelected(isSelected: Bool) {
        
        radioButton.isSelected = isSelected
    }
}

// MARK: - Setup View
extension CheckBoxFiltersCell {
    
    private func setupView() {
        backgroundColor = .clear
        
        setupContainerView()
        setupLabelView()
        setupRadioButton()
        setupLineSeparator()
    }
    
    private func setupContainerView() {
        contentView.addSubview(containerView)
        setupContainerViewConstraints()
    }
    
    private func setupLabelView() {
        containerView.addSubview(labelView)
        setupLabelViewConstraints()
    }
    
    private func setupRadioButton() {
        containerView.addSubview(radioButton)
        setupRadioButtonConstraints()
    }
    
    private func setupLineSeparator() {
        containerView.addSubview(lineSeparator)
        setupLineSeparatorConstraints()
    }
}

extension CheckBoxFiltersCell {
    @objc func radioButtonTapped() {
//        if let parentTableView = superview as? UITableView {
//            parentTableView.visibleCells.forEach { cell in
//                if let cell = cell as? Self {
//                    cell.radioButtonSetSelected(isSelected: false)
//                }
//            }
//            self.radioButtonSetSelected(isSelected: true)
//        }
     //   self.radioButtonSetSelected(isSelected: true)
        radioButton.isSelected.toggle()
    }
}

// MARK: - Constraints
extension CheckBoxFiltersCell {
    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    private func setupLabelViewConstraints() {
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            labelView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            labelView.heightAnchor.constraint(equalToConstant: CGFloat(20))
        ])
    }
    
    private func setupRadioButtonConstraints() {
        NSLayoutConstraint.activate([
            radioButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            radioButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
    }
    
    private func setupLineSeparatorConstraints() {
        NSLayoutConstraint.activate([
            lineSeparator.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 20),
            lineSeparator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            lineSeparator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            lineSeparator.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 1),
            lineSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
