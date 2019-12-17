//
//  Models.swift
//  ece564-proj
//
//  Created by Guanwen Wang on 11/14/19.
//  Copyright © 2019 Duke University. All rights reserved.
//

import Foundation
import CoreLocation

struct Root: Codable {
    let businesses: [Business]
}

struct Categories:Codable {
    let alias: String
    let title: String
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
}

// ************ Business Model ************ //
struct Business: Codable {
    let id: String?
    let name: String?
    let imageUrl: URL?
    let distance: Double
    let phone: String?
    let price: String?
    let categories: [Categories]
    let coordinates: Coordinate?
    let rating:Decimal?
}

struct RestaurantListViewModel {
    let name: String?
    let imageUrl: URL?
    let distance: Double
    let id: String?
    let phone: String?
    let price: String?
    let categories: [Categories]
    let coordinates: Coordinate?
    let rating:Decimal?

    static var numberFormatter: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 2
        nf.minimumFractionDigits = 2
        return nf
    }

    var formattedDistance: String? {
        return RestaurantListViewModel.numberFormatter.string(from: distance as NSNumber)
    }
}

extension RestaurantListViewModel {
    init(business: Business) {
        self.name = business.name
        self.id = business.id
        self.imageUrl = business.imageUrl
        self.distance = (business.distance ) / 1609.344
        self.phone = business.phone
        self.price = business.price
        self.categories = business.categories
        self.coordinates = business.coordinates
        self.rating = business.rating
    }
}

// ************ Detail Model ************ //
struct Details: Decodable {
    let price: String?
    let phone: String?
    //let isClosed: Bool
    let rating: Double?
    let name: String?
    let photos: [URL]?
    let coordinates: CLLocationCoordinate2D
    let categories:[Categories]

}

extension CLLocationCoordinate2D: Decodable {
    enum CodingKeys: CodingKey {
        case latitude
        case longitude
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        self.init(latitude: latitude, longitude: longitude)
    }
}


struct DetailsViewModel {
    let name: String?
    let price: String?
    //let isOpen: String
    let phoneNumber: String?
    let rating: String?
    let imageUrls: [URL]?
    let coordinate: CLLocationCoordinate2D
    let categories:[Categories]
}

extension DetailsViewModel {
    init(details: Details) {
        self.name = details.name
        self.price = details.price
        //self.isOpen = details.isClosed ? "Closed" : "Open"
        self.phoneNumber = details.phone
        self.rating = "\(details.rating ?? 0) / 5.0"
        self.imageUrls = details.photos
        self.coordinate = details.coordinates
        self.categories = details.categories
    }
}

struct LocationModel: Codable {
    let displayAddress: [String]?
}

struct EventRoot: Codable {
    let events: [Event]
}

struct Event: Codable {
    let id: String?
    let name: String?
    let category: String?
    let imageUrl: URL?
    let isFree: Bool
    let location: LocationModel?
//    let description: String?
    let timeStart: String?
    let timeEnd: String?
    let latitude: Double?
    let longitude: Double?
}

struct EventListViewModel {
    let id: String?
    let name: String?
    let category: String?
    let imageUrl: URL?
    let isFree: Bool
    let location: LocationModel?
//    let description: String?
    let timeStart: String?
    let timeEnd: String?
    let latitude: Double?
    let longitude: Double?
}

extension EventListViewModel {
    init(event: Event) {
        self.id = event.id
        self.name = event.name
        self.category = event.category
        self.imageUrl = event.imageUrl
        self.isFree = event.isFree
        self.location = event.location
//        self.description = event.description
        self.timeStart = event.timeStart
        self.timeEnd = event.timeEnd
        self.latitude = event.latitude
        self.longitude = event.longitude
    }
}




struct eventDetails: Decodable {
    let name: String?
    let category: String?
    let imageUrl: URL?
    let isFree: Bool
    let location: LocationModel?
//    let description: String?
    let timeStart: String?
    let timeEnd: String?
    let latitude: Double?
    let longitude: Double?
}

struct eventDetailsViewModel {
    let name: String?
    let category: String?
    let imageUrl: URL?
    let isFree: Bool
    let location: LocationModel?
//    let description: String?
    let timeStart: String?
    let timeEnd: String?
    let latitude: Double?
    let longitude: Double?
}

extension eventDetailsViewModel {
    init(eventDetails: eventDetails) {
        self.name = eventDetails.name
        self.category = eventDetails.category
        self.imageUrl = eventDetails.imageUrl
        self.isFree = eventDetails.isFree
        self.location = eventDetails.location
//        self.description = eventDetails.description
        self.timeStart = eventDetails.timeStart
        self.timeEnd = eventDetails.timeEnd
        self.latitude = eventDetails.latitude
        self.longitude = eventDetails.longitude
    }
}
