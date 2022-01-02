//
//  Label+View.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit

class LabelView: UIView {
    
    private let labelView: UILabel = {
        let labelView = UILabel()
        labelView.numberOfLines = 0
        labelView.lineBreakMode = .byWordWrapping
        labelView.textAlignment = .left
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.textColor = UIColor.colorCatalog(name: .primaryTextColor)
        
        return labelView
    }()
    
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
        addSubview(labelView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: topAnchor),
            labelView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Configure Method
extension LabelView {
    func configureView(with text: String, and font: UIFont) {
        labelView.text = text
        labelView.font = font
    }
}
