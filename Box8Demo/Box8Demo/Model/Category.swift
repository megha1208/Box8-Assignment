//
//  Category.swift
//  Box8Demo
//
//  Created by Megha Johari on 5/1/19.
//  Copyright © 2019 Megha Johari. All rights reserved.
//

import Foundation
import UIKit

struct Category {
    
    var caption: String
    var image: UIImage
    var menu: [Menu]
    
    init(caption: String, image: UIImage, menu: [Menu]) {
        self.caption = caption
        self.image = image
        self.menu = menu
    }
    
    init?(dictionary: [String: Any]) {
        guard let caption = dictionary["Caption"], let photo = dictionary["Photo"], let image = UIImage(named: photo as! String),
            let menuArray = dictionary["Menu"] else {
            return nil
        }
        
        var menu: [Menu] = []
        for item in menuArray as! [Any] {
            let menuItem = Menu(dictionary: item as! [String : String])
            menu.append(menuItem!)
        }
        self.init(caption: caption as! String, image: image, menu: menu)
    }
    
    static func allCategories() -> [Category] {
        var categories = [Category]()
        guard let Url = Bundle.main.url(forResource: "Categories", withExtension: "plist"),
            let categoriesFromPlist = NSArray(contentsOf: Url) as? [[String: Any]] else {
            return categories
        }
        for dictionary in categoriesFromPlist {
            if let category = Category(dictionary: dictionary) {
                categories.append(category)
            }
        }

        return categories
    }
    
    static func allOffers() -> [String] {
        let offers = [String]()
        guard let Url = Bundle.main.url(forResource: "Offers", withExtension: "plist"),
        let offersfromPlist = NSArray(contentsOf: Url) as? [String] else {
            return offers
        }
        return offersfromPlist
    }
}

struct Menu {
    
    var title: String
    var image: UIImage
    var description: String
    var price: String
    
    init(title: String, description: String, image: UIImage, price: String) {
        self.title = title
        self.description = description
        self.image = image
        self.price = price
    }
    
    init?(dictionary: [String:String]) {
        guard let title = dictionary["Item"], let photo = dictionary["Item Photo"], let image = UIImage(named: photo ),
            let description = dictionary["Description"],
            let itemPrice = dictionary["Price"] else {
                return nil
        }
        let price = "\u{20B9}" + itemPrice
        self.init(title: title, description: description, image: image, price: price)
    }
    
}
