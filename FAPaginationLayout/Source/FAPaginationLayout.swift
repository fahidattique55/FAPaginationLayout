//
//  FAFlowLayout.swift
//  FAPaginationLayout
//
//  Created by Fahid Attique on 14/06/2017.
//  Copyright © 2017 Fahid Attique. All rights reserved.
//

import UIKit


public class FAPaginationLayout: UICollectionViewFlowLayout {
    
    
    
    //  Class properties
    
    var insertingTopCells: Bool = false
    var sizeForTopInsertions: CGSize = CGSize.zero
    
    
    
    
    //  Preparing the layout
    
    override public func prepare() {
        
        super.prepare()

        let oldSize: CGSize = sizeForTopInsertions
        
        if insertingTopCells {
            
            let newSize: CGSize  = collectionViewContentSize
            let xOffset: CGFloat = collectionView!.contentOffset.x + (newSize.width - oldSize.width)
            let newOffset: CGPoint = CGPoint(x: xOffset, y: collectionView!.contentOffset.y)
            collectionView!.contentOffset = newOffset
        }
        else {
            insertingTopCells = false
        }

        sizeForTopInsertions = collectionViewContentSize
    }
    
    
    
    
    //  configuring the content offsets relative to the scroll velocity
    
    override public func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        var layoutAttributes: Array = layoutAttributesForElements(in: collectionView!.bounds)!
        
        if layoutAttributes.count == 0 {
            return proposedContentOffset
        }
        
        var firstAttribute: UICollectionViewLayoutAttributes = layoutAttributes[0]
        
        for attribute: UICollectionViewLayoutAttributes in layoutAttributes {
            
            if attribute.representedElementCategory != .cell {
                continue
            }
            
            if((velocity.x > 0.0 && attribute.center.x > firstAttribute.center.x) ||
                (velocity.x <= 0.0 && attribute.center.x < firstAttribute.center.x)) {
                firstAttribute = attribute;
            }
        }

        return CGPoint(x: firstAttribute.center.x - collectionView!.bounds.size.width * 0.5, y: proposedContentOffset.y)
    }

    
}
