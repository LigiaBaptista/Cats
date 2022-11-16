//
//  CatsListCollectionViewCell.swift
//  Cats
//
//  Created by Lígia Maria on 06/09/22.
//

import UIKit

class CatsListCollectionViewCell: UICollectionViewCell, ViewCode {
   
    static let identifier: String = "CatsListCollectionViewCell"
    
    let catImageView: UIImageView = UIImageView()
    let catNameLabel: UILabel = UILabel()
    
    func setupViewHierarchy() {
        contentView.addSubview(catImageView)
        contentView.addSubview(catNameLabel)
    }
    
    func setupConstrains() {
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        catImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        catImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        catImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        catNameLabel.translatesAutoresizingMaskIntoConstraints = false
        catNameLabel.topAnchor.constraint(equalTo: catImageView.bottomAnchor).isActive = true
        catNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        catNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        catNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        catNameLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    func configureViews() {
        contentView.clipsToBounds = true
        
        catImageView.backgroundColor = .white
        catImageView.contentMode = .scaleAspectFill
        catImageView.clipsToBounds = true
        
        catNameLabel.textColor = .black
        catNameLabel.backgroundColor = .white
        catNameLabel.textAlignment = .center
    }
    
    func setup(catName: String, catImage: String) {
        setupViews()
        catNameLabel.text = catName
        catImageView.image = UIImage(named: catImage)
    }

}
