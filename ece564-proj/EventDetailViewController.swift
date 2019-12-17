//
//  EventDetailViewController.swift
//  ece564-proj
//
//  Created by Yunhe Wang on 11/17/19.
//  Copyright © 2019 Duke University. All rights reserved.
//

import UIKit
import MapKit

class EventDetailViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var eventCategoryLabel: UILabel!
    @IBOutlet weak var eventCostLabel: UILabel!
    @IBOutlet weak var eventTimeStartLabel: UILabel!
    @IBOutlet weak var eventTimeEndLabel: UILabel!
    @IBOutlet weak var eventLocationLabel: UILabel!
//    @IBOutlet weak var eventDescriptionLabel: UILabel!
        
    var detail: EventListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eventImage.af_setImage(withURL: (detail?.imageUrl)!)
        self.eventNameLabel.text = detail?.name
        self.eventCategoryLabel.text = detail?.category
        self.eventCostLabel.text = "Not Free"
        if (detail?.isFree == true) {
            self.eventCostLabel.text = "Free"
        }
        self.eventTimeStartLabel.text = detail?.timeStart
        self.eventTimeEndLabel.text = detail?.timeEnd ?? "TBD"
        self.eventLocationLabel.text = ""
        for addr in (detail?.location?.displayAddress)! {
            eventLocationLabel.text! += addr
        }
//        self.eventDescriptionLabel.text = detail?.description
        // Do any additional setup after loading the view.
        let destCoords = CLLocationCoordinate2D(latitude: (detail?.latitude)!, longitude: (detail?.longitude)!)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: destCoords, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = destCoords
        mapView.addAnnotation(annotation)
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
