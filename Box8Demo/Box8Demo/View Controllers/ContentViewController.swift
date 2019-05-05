//
//  ContentViewController.swift
//  Box8Demo
//
//  Created by Megha Johari on 5/4/19.
//  Copyright © 2019 Megha Johari. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var menu: [Menu]? {
        didSet {
            if let menuItems = menu {
                menuArray = menuItems
            }
        }
    }
    
    var menuArray: [Menu] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // MARK: - Table View Datasource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ContentTableViewCell
        cell.menuImageview.image = menuArray[indexPath.row].image
        cell.titleLabel.text = menuArray[indexPath.row].title
        cell.descriptionLabel.text = menuArray[indexPath.row].description
        cell.priceLabel.text = menuArray[indexPath.row].price
        return cell
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

class ContentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuImageview: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
}
