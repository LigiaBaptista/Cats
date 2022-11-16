//
//  CatsListViewController.swift
//  Cats
//
//  Created by Lígia Maria on 06/09/22.
//

import UIKit

class CatsListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, ViewCode {
    
    let cats: [Cat] = [Cat(name: "British" , image: "british"),
                        Cat(name: "Maine Coon", image: "mainecoon"),
                        Cat(name: "Munchkin", image: "munchkin"),
                        Cat(name: "Persa", image: "persa"),
                        Cat(name: "Siames", image: "siames"),
                        Cat(name: "Siberiano", image: "siberiano"),
                        Cat(name: "Somali", image: "somali"),
                        Cat(name: "Sphynx", image: "sphynx")]
    
    lazy var catsListCollectionView: UICollectionView = {
        let catsListCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        catsListCollectionView.dataSource = self
        catsListCollectionView.delegate = self
        return catsListCollectionView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy() {
        view.addSubview(catsListCollectionView)
    }
    
    func setupConstrains() {
        catsListCollectionView.translatesAutoresizingMaskIntoConstraints = false
        catsListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        catsListCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        catsListCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        catsListCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cats.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let catsListCollectionViewCell: CatsListCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CatsListCollectionViewCell.identifier, for: indexPath) as? CatsListCollectionViewCell else {
            return UICollectionViewCell()
        }
        let cats = cats[indexPath.item]
        catsListCollectionViewCell.setup(catName: cats.name, catImage: cats.image)
        return catsListCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let spaces: CGFloat = 16 * 3
        let cellWidth: CGFloat = (screenWidth - spaces) / 2
        return CGSize(width: cellWidth, height: cellWidth * 1.6)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCat: Cat = cats[indexPath.item]
        debugPrint(selectedCat.name)
        UserDefaults.standard.set(true, forKey: selectedCat.name)
        
    }
    
    func configureViews() {
        catsListCollectionView.register(CatsListCollectionViewCell.self, forCellWithReuseIdentifier: CatsListCollectionViewCell.identifier)
        catsListCollectionView.contentInset = .init(top: 16, left: 16, bottom: 16, right: 16)
    }
    
}
