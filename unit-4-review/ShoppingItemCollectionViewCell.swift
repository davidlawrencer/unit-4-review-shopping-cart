//
//  ShoppingItemCollectionViewCell.swift
//  unit-4-review
//
//  Created by David Rifkin on 10/23/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ShoppingItemCollectionViewCell: UICollectionViewCell {

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(imageView)
    }
    
    private func setConstraints() {
        setImageViewConstraints()
        setNameLabelConstraints()
        setPriceLabelConstraints()
    }

    private func setImageViewConstraints(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func setNameLabelConstraints(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.heightAnchor.constraint(equalToConstant: 24),
            nameLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
    }
    
    private func setPriceLabelConstraints(){
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            priceLabel.heightAnchor.constraint(equalToConstant: 24),
            priceLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
    }
}
