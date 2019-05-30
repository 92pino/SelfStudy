//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by JinBae Jeong on 21/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

// 편의상 전역변수

let imagesCount = 21

var images: [UIImage] { /*...*/ return images }

class MainViewController: UIViewController, UICollectionViewDataSource {
    
    let collectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: "image")
        view.addSubview(collectionView)
        autoLayout()
    }
    
    func autoLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return bountyInfoList.count
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as! TestCollectionViewCell// Dequeueing생략
        
        
        
        cell.imageView.image = UIImage(named: bountyInfoList[indexPath.row].name)
        
        
        
        return cell
        
    }
    
}



class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
}

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var layoutCache: [UICollectionViewLayoutAttributes]? = nil
    
    
    
    override func prepare() {
        
        super.prepare()
        
        
        
        let width = (collectionView?.bounds.size.width ?? 375) / 2 - 5
        
        
        
        // attribute 만드는 작업은 한번만 합니다.
        
        guard layoutCache == nil else { return }
        
        
        
        var attrsList: [UICollectionViewLayoutAttributes] = []
        
        for (index, image) in images.enumerated() {
            
            let isOdd = index % 2 == 0
            
            let attrs = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: index, section: 0))
            
            let ratio = image.size.height / image.size.width
            
            let height = width * ratio
            
            
            
            var frame = CGRect(x: isOdd ? 0 : width + 10, y: 0, width: width, height: height)
            
            if index > 1 {
                
                let upperImage = attrsList[index-2]
                
                frame.origin.y = upperImage.frame.origin.y + upperImage.frame.size.height + 10
                
            }
            
            attrs.frame = frame
            
            
            
            attrsList.append(attrs)
            
        }
        
        
        
        layoutCache = attrsList
        
    }
    
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        guard let layoutCache = layoutCache else { return super.layoutAttributesForElements(in: rect) }
        
        
        
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        
        
        for attributes in layoutCache {
            
            if attributes.frame.intersects(rect) {
                
                layoutAttributes.append(attributes)
                
            }
            
        }
        
        
        
        return layoutAttributes
        
    }
    
}
