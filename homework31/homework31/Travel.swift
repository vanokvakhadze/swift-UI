//
//  Travel.swift
//  homework31
//
//  Created by vano Kvakhadze on 29.05.24.
//

import Foundation

class Travel: ObservableObject, Identifiable, Hashable {
    var id = UUID()
    @Published var country: String
    @Published var Countryimage: String
    @Published var city: String
    @Published var cityImage: String
    @Published var transport: Transport
    @Published var hotel: Hotel
    @Published var mustSeenPlaces: Sightseeing
    
    init(country: String, Countryimage: String, city: String, cityImage: String, transport: Transport, hotel: Hotel, mustSeenPlaces: Sightseeing) {
        self.country = country
        self.Countryimage = Countryimage
        self.city = city
        self.cityImage = cityImage
        self.transport = transport
        self.hotel = hotel
        self.mustSeenPlaces = mustSeenPlaces
    }
    
    static func == (lhs: Travel, rhs: Travel) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    class Transport: ObservableObject, Identifiable, Hashable {
        var id = UUID()
        @Published var airplane: String
        @Published var bus: String
        @Published var car: String
        
        init(airplane: String, bus: String, car: String) {
            self.airplane = airplane
            self.bus = bus
            self.car = car
        }

        static func == (lhs: Transport, rhs: Transport) -> Bool {
            lhs.id == rhs.id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
    
    class Hotel: ObservableObject, Identifiable, Hashable {
        var id = UUID()
        @Published var name: String
        @Published var price: Int
        @Published var image: String
        
        
        init(name: String, price: Int, image: String) {
            self.name = name
            self.price = price
            self.image = image
        }

        static func == (lhs: Hotel, rhs: Hotel) -> Bool {
            lhs.id == rhs.id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
    
    class Sightseeing: ObservableObject, Identifiable, Hashable {
        var id = UUID()
        @Published var mustSeenPlaces: [String]
        
        init(mustSeenPlaces: [String]) {
            self.mustSeenPlaces = mustSeenPlaces
        }

        static func == (lhs: Sightseeing, rhs: Sightseeing) -> Bool {
            lhs.id == rhs.id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
}





let places = [Travel(country: "Georgia", Countryimage: "Georgia", city: "Tbilisi", cityImage: "Tbilisi",
                     transport: Travel.Transport(airplane: "1:30", bus: "2:00", car: "0:30"),
                     hotel: Travel.Hotel(name: "Radison",  price: 45, image: "tbilisi hotel"),
                     mustSeenPlaces: Travel.Sightseeing(mustSeenPlaces: ["Dzveli Tbilisi", "Narikala", "Sameba Church"])),
              
              Travel(country: "France", Countryimage: "france", city: "Paris", cityImage: "paris",
                     transport: Travel.Transport(airplane: "0:45", bus: "1:35", car: "0:50"),
                     hotel:Travel.Hotel(name: "Hotel Tower", price: 125, image: "paris hotel"),
                     mustSeenPlaces: Travel.Sightseeing(mustSeenPlaces: ["Eifel Tower", "Arc Da Triomphe", "Louvre Museum"])),
              
              Travel(country: "Italy", Countryimage: "Italy", city: "Rome", cityImage: "rome",
                     transport: Travel.Transport(airplane: "4:45", bus: "2:35", car: "1:50"),
                     hotel: Travel.Hotel(name: "hotel Rome", price: 75, image: "italy hotel"),
                     mustSeenPlaces: Travel.Sightseeing(mustSeenPlaces: ["Colosseum", "Pantheon", "Roman Forum"])),
              
              Travel(country: "Germany", Countryimage: "germany", city: "Berlin ", cityImage: "berlin", transport: Travel.Transport(airplane: "3:25", bus: "1:00", car: "0:45"), hotel: Travel.Hotel(name: "Berlim Radison", price: 340, image: "berlin hotel"), mustSeenPlaces: Travel.Sightseeing(mustSeenPlaces: ["Branderburg Gate", "Berlin TV Tower", "Richstag Building", "Berlin Wall Memorial"]))
]

var travelHints = ["მზის დამცავი არ დაგრჩეს", "ფოვერბანკიი რატომ არ მიგაქვს", "ძაღლებს და მაიმუნებს ერიდე",  "თუ დაიკარგე არ იდარდო", "არ ჭამო სთრით ფუდი მითუმეტეს ინდოეთში" ]
