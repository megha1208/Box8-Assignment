//
//  MenuViewController.swift
//  Box8Demo
//
//  Created by Megha Johari on 5/3/19.
//  Copyright © 2019 Megha Johari. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, ACTabScrollViewDataSource, ACTabScrollViewDelegate {


    @IBOutlet weak var tabScrollView: ACTabScrollView!
    var contentViews: [UIView] = []
    var menuCategories = Category.allCategories()
    var pageNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        tabScrollView.defaultPage = pageNumber
        tabScrollView.arrowIndicator = true
        
        tabScrollView.delegate = self
        tabScrollView.dataSource = self
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        for category in menuCategories {
            let vc = storyboard.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
            vc.menu = category.menu
            
            addChild(vc)
            contentViews.append(vc.view)
        }
    }
    
    func configureNavigationBar() {
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.title = "Menu"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    // MARK: - ACTabSCrollView Datasource
    
    func numberOfPagesInTabScrollView(_ tabScrollView: ACTabScrollView) -> Int {
        return menuCategories.count
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, tabViewForPageAtIndex index: Int) -> UIView {
        let label = UILabel()
        label.text = String(describing: menuCategories[index].caption).uppercased()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.sizeToFit()
        label.frame.size = CGSize(width: label.frame.size.width + 28, height: label.frame.size.height + 36)
        return label
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, contentViewForPageAtIndex index: Int) -> UIView {
        return contentViews[index]
    }
    
    // MARK: - ACTabScrollView Delegate
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, didChangePageTo index: Int) {
        
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, didScrollPageTo index: Int) {
        
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

