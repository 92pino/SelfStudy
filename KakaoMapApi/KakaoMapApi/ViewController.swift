//
//  ViewController.swift
//  KakaoMapApi
//
//  Created by JinBae Jeong on 22/05/2019.
//  Copyright © 2019 pino. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MTMapViewDelegate {

    lazy var mapView: MTMapView = MTMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.baseMapType = .standard
        self.view.addSubview(mapView)
        
        mapView.setMapCenter(MTMapPoint(geoCoord: .init(latitude: 37.544882, longitude: 127.058204)), zoomLevel: 0, animated: true)
        
        var items1 = MTMapPOIItem()
        items1.itemName = "어니언"
        items1.mapPoint = MTMapPoint(geoCoord: .init(latitude: 37.544882, longitude: 127.058204))
        items1.markerType = .redPin
        items1.showAnimationType = MTMapPOIItemShowAnimationType.dropFromHeaven
        mapView.addPOIItems([items1])
    }

}
