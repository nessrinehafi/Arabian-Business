//
//  SearchFeaturesTableViewCell.swift
//  Arabian Business
//
//  Created by Nessrine on 8/2/19.
//  Copyright © 2019 com.NessrineHafi. All rights reserved.
//

import UIKit
import NightNight
class SearchFeaturesTableViewCell: UITableViewCell , UICollectionViewDelegate, UICollectionViewDataSource ,UIScrollViewDelegate {
    
    private var indexOfCellBeforeDragging = 0

    @IBOutlet weak var featuresCollection: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchFeaturesCollectionViewCell", for: indexPath as IndexPath) as! SearchFeaturesCollectionViewCell
       
        return cell
    }

    @objc(collectionView:layout:sizeForItemAtIndexPath:)
    func collectionView(_ collectionView: FeaturesCollectionViewCell, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 207, height: 200)
    }

   
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // PageController.currentPage = Int(pageIndex)
        let pageWidth = 207 // The width your page should have (plus a possible margin)
        let proportionalOffset = Float(featuresCollection.contentOffset.x) / Float(pageWidth)
        indexOfCellBeforeDragging = Int( round( proportionalOffset ))
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        featuresCollection.mixedBackgroundColor = MixedColor(normal: .white, night: .black)
        self.featuresCollection.dataSource = self
        self.featuresCollection.delegate = self
        self.featuresCollection.register(UINib.init(nibName: "SearchFeaturesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SearchFeaturesCollectionViewCell")
        if let layout = featuresCollection?.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
            let size = CGSize(width:(featuresCollection!.bounds.width-30)/2, height: featuresCollection!.bounds.height)
            layout.itemSize = size
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // Stop scrolling
        targetContentOffset.pointee = scrollView.contentOffset
        
        // Calculate conditions
        let pageWidth = 207
        let collectionViewItemCount = 2
        let proportionalOffset = Float(featuresCollection.contentOffset.x) / Float(pageWidth)
     
        
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
            featuresCollection.scrollToItem(at: indexPath, at: .left, animated: true)
        }
    }
    
}
