//
//  NoCellsAnimationVC.swift
//  FAPaginationLayout
//
//  Created by Fahid Attique on 14/06/2017.
//  Copyright © 2017 Fahid Attique. All rights reserved.
//

import UIKit

class NoCellsAnimationVC: UIViewController {
    
    
    
    //  IBOutlets
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    
    //  Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        viewConfigrations()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //  Private Functions
    
    
    private func viewConfigrations() {
        
        collectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        collectionView.contentInset = UIEdgeInsets.init(top: 0, left: 30, bottom: 0, right: 30)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
}






//  Collection View FlowLayout Delegate & Data Source


extension NoCellsAnimationVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
        cell.wallpaperImageView.image = UIImage(named: "\(indexPath.item)")
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cellSize: CGSize = collectionView.bounds.size
        
        cellSize.width -= collectionView.contentInset.left
        cellSize.width -= collectionView.contentInset.right
        cellSize.height = cellSize.width
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item selected at \(indexPath.row)")
    }
}
