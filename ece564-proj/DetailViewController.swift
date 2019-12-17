//
//  DetailViewController.swift
//  ece564-proj
//
//  Created by Guanwen Wang on 10/20/19.
//  Copyright © 2019 Duke University. All rights reserved.
//

import UIKit
import MapKit
import AlamofireImage

class DetailViewController: UIViewController {

//    @IBOutlet weak var collectionView: UICollectionView!
//    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleBar: UINavigationItem!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var cellphoneLabel: UILabel!
    
    var detail: RestaurantListViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("---- in detail model ----")
//        print(detail)
//        print("---- in detail model ----")
        self.priceLabel.text = detail?.price ?? "$"
        //self.hoursLabel.text = detail?.isOpen
        self.locationLabel.text = detail?.name
        self.cellphoneLabel.text = detail?.phone
        self.imageView.af_setImage(withURL: (detail?.imageUrl)!)
            
        self.titleBar.title = detail?.name
        
        
        // Do any additional setup after loading the view.
        
        
        // place map annotation
        let destCoords = CLLocationCoordinate2D(latitude: (detail?.coordinates?.latitude)!, longitude: (detail?.coordinates?.longitude)!)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: destCoords, span: span)
        mapView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.coordinate = destCoords
        mapView.addAnnotation(annotation)
        
        // place image collection
//        
//        collectionView?.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")
//        collectionView?.dataSource = self as! UICollectionViewDataSource
//        collectionView?.delegate = self as! UICollectionViewDelegate
//        collectionView?.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//
//extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return detail?.imageUrls?.count ?? 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! DetailsCollectionViewCell
//        if let url = detail?.imageUrls?[indexPath.item] {
//            cell.imageView.af_setImage(withURL: url)
//        }
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        pageControl?.currentPage = indexPath.item
//    }
//}
