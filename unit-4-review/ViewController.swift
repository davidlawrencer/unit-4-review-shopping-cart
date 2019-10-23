//
//  ViewController.swift
//  unit-4-review
//
//  Created by David Rifkin on 10/23/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

enum CellReuseIdentifier: String {
    case itemCell
}

class ViewController: UIViewController {
    
    // MARK: Views
    //collection view
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect(x: self.view.bounds.minX, y: self.view.bounds.minY, width: self.view.bounds.width, height: self.view.safeAreaLayoutGuide.layoutFrame.height), collectionViewLayout: layout)
        collectionView.backgroundColor = .cyan
        collectionView.register(ShoppingItemCollectionViewCell.self, forCellWithReuseIdentifier: CellReuseIdentifier.itemCell.rawValue)
        return collectionView
    }()

    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigateToAddScreen))
        return button
    }()
    //some kind of navigation
    //navigation bar title (to show name)
    //nav bar button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        constrainCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
        self.navigationItem.rightBarButtonItem = plusButton
    }
    
    private func constrainCollectionView() {
        //the big wordy thing to make sure that the resizing mask doesn't try to set the constraints for us
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    @objc private func navigateToAddScreen() {
        self.navigationController?.pushViewController(CreateItemViewController(), animated: true)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellReuseIdentifier.itemCell.rawValue, for: indexPath) as? ShoppingItemCollectionViewCell else {return UICollectionViewCell()}
        cell.nameLabel.text = "Chicken"
        cell.priceLabel.text = "500"
        cell.imageView.image = .checkmark
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}


//custom delegation
//user defaults
//gesture recognizers
//animations
