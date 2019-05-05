//
//  CategoryCell.swift
//  Box8Demo
//
//  Created by Megha Johari on 5/1/19.
//  Copyright © 2019 Megha Johari. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var caption: UILabel!
    var category: Category? {
        didSet {
            if let category = category {
                imageView.image = category.image
                caption.text = category.caption
            }
        }
    }
    
}
