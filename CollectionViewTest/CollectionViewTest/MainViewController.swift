//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by JinBae Jeong on 21/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

private struct Standard {
    static let space: CGFloat = 10
}

class MainViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: PinterestLayout())
    
    private var imageArray: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        makeImage()
        configure()
        autoLayout()
    }
    
    private func makeImage() {
        for i in 1...6 {
            let image = UIImage(named: "0\(i)")
            imageArray.append(image!)
        }
    }
    
    private func configure() {
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: "image")
        view.addSubview(collectionView)
    }
    
    private func autoLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as! TestCollectionViewCell
        
        cell.imageView.image = imageArray[indexPath.row]
        
        return cell
    }
}

extension MainViewController : PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        return imageArray[indexPath.item].size.height
    }
    
}
