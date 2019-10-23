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
    
    private var items = [Item]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            items = try ItemPersistenceHelper.manager.getItems()
        } catch {
            print("didn't get items")
        }
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
    
    @objc private func longPressedCell() {
        print("stuff please")
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellReuseIdentifier.itemCell.rawValue, for: indexPath) as? ShoppingItemCollectionViewCell else {return UICollectionViewCell()}
        cell.nameLabel.text = item.name
        cell.priceLabel.text = String(item.price)
        cell.imageView.image = .checkmark
        cell.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer()
        
        gesture.addTarget(self, action: #selector(longPressedCell))
        cell.addGestureRecognizer(gesture)
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
