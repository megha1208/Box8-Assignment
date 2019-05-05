//
//  HomeViewController.swift
//  Box8Demo
//
//  Created by Megha Johari on 5/1/19.
//  Copyright © 2019 Megha Johari. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController, iCarouselDataSource, iCarouselDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var carouselView: iCarousel!
    @IBOutlet weak var tabBar: UITabBar!
    
    @IBOutlet weak var backgroundScrollView: UIScrollView!
    
    var categories = Category.allCategories()
    var pageControl: UIPageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var carouselData = Category.allOffers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView.collectionViewLayout as? CategoryLayout {
            layout.delegate = self
        }
        configurePageControl()
        configureTabBar()
        backgroundScrollView.delegate = self
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMenu" {
            let indexPath: [IndexPath] = collectionView!.indexPathsForSelectedItems!
            let menuViewController: MenuViewController = (segue.destination as? MenuViewController)!
            //guard let pageNumber = indexPath[0].item else { return }
            menuViewController.pageNumber = indexPath[0].item
        }
    }
    
    // MARK: - Carousel Datasource
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return categories.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let tempView = UIView(frame: carousel.contentView.frame)
        let frame = tempView.frame
        let imageView = UIImageView()
        imageView.frame = frame
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: carouselData[index])
        tempView.addSubview(imageView)
        
        return tempView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.spacing {

            return value * 1.2
        }
        return value
    }
    
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        pageControl.currentPage = carousel.currentItemIndex
    }

    func configurePageControl() {
        pageControl.frame = CGRect(x: carouselView.frame.width/2 - 100, y: carouselView.frame.height - 20, width: 200, height: 50)
        self.pageControl.numberOfPages = categories.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.red
        self.backgroundScrollView.addSubview(pageControl)
    }
    
    func configureTabBar() {
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
    }
    
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath as IndexPath) as! CategoryCell
        cell.category = categories[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
}

extension HomeViewController: CategoryLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightWidthRatioForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let heightToWidthRatio = categories[indexPath.item].image.size.height / categories[indexPath.item].image.size.width
        return heightToWidthRatio
    }
}

extension HomeViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 1:
            let alert = UIAlertController(title: "25% Off", message: "On All Corporate Orders\nNo Minimum Order Amount", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        case 2:
            let alert = UIAlertController(title: "Sign In", message: "Sign In to refer your friends and earn by referral", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        case 3:
            let alert = UIAlertController(title: "25% Off", message: "On All Corporate Orders\nNo Minimum Order Amount", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        default:
            print("Invalid tag selected")
        }
    }
}

