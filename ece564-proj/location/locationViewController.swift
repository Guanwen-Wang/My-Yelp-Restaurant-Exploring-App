//
//  locationViewController.swift
//  ece564-proj
//
//  Created by Chong Xu on 10/20/19.
//  Copyright © 2019 Duke University. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Moya

var globalLocation: CLLocationCoordinate2D?


class locationViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    var openingimg = UIImage(named:"opening")
    
    let service = MoyaProvider<YelpService.BusinessesProvider>()
    let eventService = MoyaProvider<YelpService.EventsProvider>()
    let jsonDecoder = JSONDecoder()
    let jsonDecoder2 = JSONDecoder()

    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.img?.image = openingimg
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }

        // Do any additional setup after loading the view.
        print("++++++ in the viewDidLoad +++++")
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        loadBusinesses()
        jsonDecoder2.keyDecodingStrategy = .convertFromSnakeCase
        loadEvents()
        print("++++++ in the viewDidLoad +++++")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        globalLocation = locValue
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        loadBusinesses()
        jsonDecoder2.keyDecodingStrategy = .convertFromSnakeCase
        loadEvents()
    }
    
    func loadBusinesses() {
        service.request(.search(lat: globalLocation?.latitude ?? 0, long: globalLocation?.longitude ?? 0)) {
            (result) in
            switch result {
            case .success(let response):
                print("====global====")
                print("global Locations = \(globalLocation?.latitude) \(globalLocation?.longitude)")
                let root = try? self.jsonDecoder.decode(Root.self, from: response.data)
                //print(root)
                let viewModels = root?.businesses.compactMap(RestaurantListViewModel.init)
                    .sorted(by: { $0.distance < $1.distance })
                //print("=====viewModels====")
                //print(viewModels)
                globalViewModels = viewModels ?? []
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func loadEvents() {
        eventService.request(.search(lat: globalLocation?.latitude ?? 0, long: globalLocation?.longitude ?? 0)) {
            (result) in
            switch result {
            case.success(let response):
                let root = try? self.jsonDecoder2.decode(EventRoot.self, from: response.data)
//                print("RootLoadEvents: \(root)")
                let viewModels = root?.events.compactMap(EventListViewModel.init).sorted(by: {$0.name! < $1.name!})
//                print("RootLoadEventsViewModels: \(viewModels)")
                globalEventViewModels = viewModels ?? []
            case.failure(let error):
                print("Error: \(error)")
            }
        }
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
