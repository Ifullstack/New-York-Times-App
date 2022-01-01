//
//  PostView+Cell.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit

class PostViewCell: UITableViewCell {
    
    private var postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.contentMode = .scaleToFill
        
        return postImageView
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

// MARK: - Setup View
extension PostViewCell {
    private func setupView() {
        contentView.addSubview(postImageView)
        
        
        setupImageViewConstraints()
    }
}

// MARK: - Public Methods
extension PostViewCell {
    func configureCell(from model: PostsModel) {
        if let imageName = model.image,
           let imageUrl = URL(string: imageName),
           let data = try? Data(contentsOf: imageUrl),
           let image = UIImage(data: data) {
            DispatchQueue.main.async {
                // Asignar la imagen
                self.postImageView.image = image
            }
        }
    }
}

// MARK: - Constraints
extension PostViewCell {
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.widthAnchor.constraint(equalTo:contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: CGFloat(140))
        ])
    }
}
