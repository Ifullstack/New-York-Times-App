//
//  PostView+Cell.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import UIKit

protocol PostsViewProtocol {
    func postTapped(postModelSelected: PostsModel)
}

class PostViewCell: UITableViewCell {
    private var model: PostsModel?
    
    var delegate: PostsViewProtocol?
    
    private(set) var publicationDateLabelView: LabelView = {
        let publicationDateLabelView = LabelView(frame: .zero)
        publicationDateLabelView.translatesAutoresizingMaskIntoConstraints = false
        publicationDateLabelView.layer.opacity = 0.5
        
        return publicationDateLabelView
    }()
    
    private var postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.contentMode = .scaleToFill
        postImageView.layer.cornerRadius = 10
        postImageView.layer.masksToBounds = true
        
        return postImageView
    }()
    
    private(set) var postTitleLabelView: LabelView = {
        let postTitleLabelView = LabelView(frame: .zero)
       
        postTitleLabelView.translatesAutoresizingMaskIntoConstraints = false
        
        return postTitleLabelView
    }()
    
    private(set) var postAuthorLabelView: LabelView = {
        let postAuthorLabelView = LabelView(frame: .zero)
        postAuthorLabelView.translatesAutoresizingMaskIntoConstraints = false
        postAuthorLabelView.layer.opacity = 0.5
        
        return postAuthorLabelView
    }()
    
    private(set) var postSectionLabelView: LabelView = {
        let postSectionLabelView = LabelView(frame: .zero)
        postSectionLabelView.translatesAutoresizingMaskIntoConstraints = false
 
        return postSectionLabelView
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
        contentView.addSubview(publicationDateLabelView)
        contentView.addSubview(postImageView)
        contentView.addSubview(postAuthorLabelView)
        contentView.addSubview(postTitleLabelView)
        contentView.addSubview(postSectionLabelView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectView))
        contentView.addGestureRecognizer(tapGesture)
        
        setupPublicationDateViewConstraints()
        setupImageViewConstraints()
        setupPostAuthorLabelViewConstraints()
        setupPostTitleLabelViewConstraints()
        setupPostSectionLabelViewConstraints()
    }
}

// MARK: - User Actions
extension PostViewCell {
    @objc func didSelectView() {
        if let model = model {
            delegate?.postTapped(postModelSelected: model)
        }
    }
}

// MARK: - Public Methods
extension PostViewCell {
    func configureCell(from model: PostsModel) {
        self.model = model
        
        if let imageName = model.image,
           let imageUrl = URL(string: imageName),
           let data = try? Data(contentsOf: imageUrl),
           let image = UIImage(data: data) {
            DispatchQueue.main.async {
                self.postImageView.image = image
            }
        }
        
        self.publicationDateLabelView.configureView(with: model.publicationDate ?? "",
                                                    and: UIFont.systemFont(ofSize: 15, weight: .regular))
        
        self.postAuthorLabelView.configureView(with: model.autor ?? "",
                                               and: UIFont.systemFont(ofSize: 13, weight: .regular))
        
        self.postTitleLabelView.configureView(with: model.title ?? "",
                                              and: UIFont.systemFont(ofSize: 22, weight: .heavy))
        
        self.postSectionLabelView.configureView(with: model.section ?? "",
                                                and: UIFont.systemFont(ofSize: 13, weight: .regular))
    }
}

// MARK: - Constraints
extension PostViewCell {
    private func setupPublicationDateViewConstraints() {
        NSLayoutConstraint.activate([
            publicationDateLabelView.topAnchor.constraint(equalTo: contentView.topAnchor),
            publicationDateLabelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: publicationDateLabelView.bottomAnchor, constant: 10),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: CGFloat(140))
        ])
    }
    
    private func setupPostAuthorLabelViewConstraints() {
        NSLayoutConstraint.activate([
            postAuthorLabelView.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 5),
            postAuthorLabelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postAuthorLabelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupPostTitleLabelViewConstraints() {
        NSLayoutConstraint.activate([
            postTitleLabelView.topAnchor.constraint(equalTo: postAuthorLabelView.bottomAnchor, constant: 0),
            postTitleLabelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postTitleLabelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupPostSectionLabelViewConstraints() {
        NSLayoutConstraint.activate([
            postSectionLabelView.topAnchor.constraint(equalTo: postTitleLabelView.bottomAnchor, constant: 5),
            postSectionLabelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postSectionLabelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
