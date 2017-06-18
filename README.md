![Alt text](http://i.imgur.com/jWeALpn.png "FAPaginationLayout-Logo")


![Alt text](http://i.imgur.com/okBPcrM.gif "FAPaginationLayout-1")




[![Swift version](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat.svg)](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat.svg)
[![Support Dependecy Manager](https://img.shields.io/badge/support-CocoaPods-red.svg?style=flat.svg)](https://img.shields.io/badge/support-CocoaPods-red.svg?style=flat.svg)
[![Version](https://img.shields.io/cocoapods/v/FAPaginationLayout.svg?style=flat)](http://cocoapods.org/pods/FAPaginationLayout)
[![License](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)
[![Platform](https://img.shields.io/cocoapods/p/FAPaginationLayout.svg?style=flat)](http://cocoapods.org/pods/FAPaginationLayout)




## Features

* Animates cell size while scrolling
* Adds pagination in your collection view
* Show users that collection has more cells or data
* Customizeable with collection view's content insets
* Easy to integrate and use




## Installation


### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```


To integrate FAPaginationLayout into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
pod 'FAPaginationLayout'
end
```

Then, run the following command:

```bash
$ pod install
```



## Usage

#### Step 1

* Set the collection view flow layout as ``` FAPaginationLayout ``` as given below,

![Alt text](http://i.imgur.com/r697FRw.png "FAPaginationLayout-step1")


#### Step 2 (For cell size animation while scrolling)

* Set the contentInsets of collection view,

``` collectionView.contentInset = UIEdgeInsetsMake(0, 30, 0, 30) ```


* Set the collectionView's item size according to collectionView's content insets and scale/animate it accordingly, 

```swift 


override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    updateCellsLayout()
}

func updateCellsLayout()  {

    let centerX = collectionView.contentOffset.x + (collectionView.frame.size.width)/2
    for cell in collectionView.visibleCells {

        var offsetX = centerX - cell.center.x
        if offsetX < 0 {
            offsetX *= -1
        }

        cell.transform = CGAffineTransform.identity
        if offsetX > 50 {

            let offsetPercentage = (offsetX - 50) / view.bounds.width
            var scaleX = 1-offsetPercentage
            if scaleX < 0.8 {
                scaleX = 0.8
            }
            cell.transform = CGAffineTransform(scaleX: scaleX, y: scaleX)
        }
    }
}


func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    var cellSize: CGSize = collectionView.bounds.size

    cellSize.width -= collectionView.contentInset.left * 2
    cellSize.width -= collectionView.contentInset.right * 2
    cellSize.height = cellSize.width

    return cellSize
}

func scrollViewDidScroll(_ scrollView: UIScrollView) {
    updateCellsLayout()
}

```




#### Step 2 (Without cell size animation)

* Set the content insets of collectionView as per your need 

``` collectionView.contentInset = UIEdgeInsetsMake(0, 20, 0, 20) ```


#### Step 3

* Set the collectionView's item size according to collectionView's content insets. 

```swift 

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    var cellSize: CGSize = collectionView.bounds.size
    cellSize.width -= collectionView.contentInset.left
    cellSize.width -= collectionView.contentInset.right

    return cellSize
}



* Now run the Xcode project and enjoy! 



## License

This project is licensed under the  MIT License. 


## Author

**Fahid Attique** - https://github.com/fahidattique55
