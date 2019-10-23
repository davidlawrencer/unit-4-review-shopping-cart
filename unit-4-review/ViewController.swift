//
//  ViewController.swift
//  unit-4-review
//
//  Created by David Rifkin on 10/23/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: Views
    //collection view
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect(x: self.view.bounds.minX, y: self.view.bounds.minY, width: self.view.bounds.width, height: self.view.safeAreaLayoutGuide.layoutFrame.height), collectionViewLayout: layout)
        collectionView.backgroundColor = .cyan
        return collectionView
    }()

    //some kind of navigation
    
    //navigation bar title (to show name)
    
    //nav bar button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        constrainCollectionView()
        
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
}

//custom delegation
//user defaults
//gesture recognizers
//animations
