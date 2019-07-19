//
//  FeaturesTableViewCell.swift
//  Arabian Business
//
//  Created by Nessrine on 7/17/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit

class FeaturesTableViewCell: UITableViewCell  , UIScrollViewDelegate , UICollectionViewDelegate, UICollectionViewDataSource
{
    private var indexOfCellBeforeDragging = 0
    
    @IBOutlet weak var PageController: UIPageControl!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturesCollectionViewCell", for: indexPath as IndexPath) as! FeaturesCollectionViewCell
        let pages = round(featuresViewCollection.contentSize.width/414)
        PageController.numberOfPages = Int(pages)
        return cell
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        PageController.currentPage = 0
        PageController.currentPageIndicatorTintColor = UIColor(red: 188/255, green: 3/255, blue: 21/255, alpha: 1)
        PageController.pageIndicatorTintColor = UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 1)
        self.featuresViewCollection.dataSource = self
        self.featuresViewCollection.delegate = self
        self.featuresViewCollection.register(UINib.init(nibName: "FeaturesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FeaturesCollectionViewCell")
      


    }

@objc(collectionView:layout:sizeForItemAtIndexPath:)
    func collectionView(_ collectionView: FeaturesCollectionViewCell, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: 414, height: 297)
    }
    
    @IBOutlet weak var featuresViewCollection: UICollectionView!
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
       // PageController.currentPage = Int(pageIndex)
        let pageWidth = 414 // The width your page should have (plus a possible margin)
        let proportionalOffset = Float(featuresViewCollection.contentOffset.x) / Float(pageWidth)
        indexOfCellBeforeDragging = Int( round( proportionalOffset ))
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // Stop scrolling
        targetContentOffset.pointee = scrollView.contentOffset

        // Calculate conditions
        let pageWidth = 410
        let collectionViewItemCount = 2
        let proportionalOffset = Float(featuresViewCollection.contentOffset.x) / Float(pageWidth)
        PageController.currentPage = Int(proportionalOffset) 

        let indexOfMajorCell = Int(round(proportionalOffset))
        let swipeVelocityThreshold: CGFloat = 0.5
        let hasEnoughVelocityToSlideToTheNextCell = indexOfCellBeforeDragging + 1 < collectionViewItemCount && velocity.x > swipeVelocityThreshold
        let hasEnoughVelocityToSlideToThePreviousCell = indexOfCellBeforeDragging - 1 >= 0 && velocity.x < -swipeVelocityThreshold
        let majorCellIsTheCellBeforeDragging = indexOfMajorCell == indexOfCellBeforeDragging
        let didUseSwipeToSkipCell = majorCellIsTheCellBeforeDragging && (hasEnoughVelocityToSlideToTheNextCell || hasEnoughVelocityToSlideToThePreviousCell)
        
        if didUseSwipeToSkipCell {
            
            // Animate so that swipe is just continued
            let snapToIndex = indexOfCellBeforeDragging + (hasEnoughVelocityToSlideToTheNextCell ? 1 : -1)
            let toValue = pageWidth * Int(CGFloat(snapToIndex))
            UIView.animate(
                withDuration: 0.3,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: velocity.x,
                options: .allowUserInteraction,
                animations: {
                    scrollView.contentOffset = CGPoint(x: toValue, y: 0)
                    scrollView.layoutIfNeeded()
            },
                completion: nil
            )
        } else {
            // Pop back (against velocity)
            let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
            featuresViewCollection.scrollToItem(at: indexPath, at: .left, animated: true)
        }
    }
    
}
