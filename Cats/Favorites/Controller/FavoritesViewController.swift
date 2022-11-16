//
//  FavoritesViewController.swift
//  Cats
//
//  Created by Lígia Maria on 08/09/22.
//

import UIKit

final class FavoritesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, ViewCode {
   
    let cats: [Cat] = [Cat(name: "British" , image: "british"),
                        Cat(name: "Maine Coon", image: "mainecoon"),
                        Cat(name: "Munchkin", image: "munchkin"),
                        Cat(name: "Persa", image: "persa"),
                        Cat(name: "Siames", image: "siames"),
                        Cat(name: "Siberiano", image: "siberiano"),
                        Cat(name: "Somali", image: "somali"),
                        Cat(name: "Sphynx", image: "sphynx")]
    
    var favoriteCats: [Cat] {
        var favorites: [Cat] = []
        for currentCat in cats {
            if let isFavorite: Bool = UserDefaults.standard.value(forKey: currentCat.name) as? Bool, isFavorite {
                favorites.append(currentCat)
            }
        }
        return favorites
    }
    
    lazy var collectionView: UICollectionView = {
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteCats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CatsListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CatsListCollectionViewCell.identifier, for: indexPath) as? CatsListCollectionViewCell else {
            return UICollectionViewCell()
        }
        let favoriteCat: Cat = favoriteCats[indexPath.item]
        cell.setup(catName: favoriteCat.name, catImage: favoriteCat.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let spaces: CGFloat = 16 * 3
        let cellWidth: CGFloat = (screenWidth - spaces) / 2
        return CGSize(width: cellWidth, height: cellWidth * 1.6)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCat: Cat = favoriteCats[indexPath.item]
        UserDefaults.standard.set(false, forKey: selectedCat.name)
        collectionView.reloadData()
    }
    
    func setupViewHierarchy() {
        view.addSubview(collectionView)
    }
    
    func setupConstrains() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func configureViews() {
        collectionView.register(CatsListCollectionViewCell.self, forCellWithReuseIdentifier: CatsListCollectionViewCell.identifier)
        collectionView.contentInset = .init(top: 16, left: 16, bottom: 16, right: 16)
    }
    
}
