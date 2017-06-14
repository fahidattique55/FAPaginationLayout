![Alt text](http://i.imgur.com/jWeALpn.png "FAPaginationLayout-Logo")




[![Swift version](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat.svg)](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat.svg)
[![Support Dependecy Manager](https://img.shields.io/badge/support-CocoaPods-red.svg?style=flat.svg)](https://img.shields.io/badge/support-CocoaPods-red.svg?style=flat.svg)
[![Version](https://img.shields.io/cocoapods/v/FAPaginationLayout.svg?style=flat)](http://cocoapods.org/pods/FAPaginationLayout)
[![License](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)
[![Platform](https://img.shields.io/cocoapods/p/FAPaginationLayout.svg?style=flat)](http://cocoapods.org/pods/FAPaginationLayout)





## Quick Look


![Alt text](http://i.imgur.com/a1huavH.gif "FAPaginationLayout-1")

![Alt text](http://i.imgur.com/zFepRnd.gif "FAPaginationLayout-2")




## Features

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


#### Step 2

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


```


* Now run the Xcode project and enjoy! 



## License

This project is licensed under the  MIT License. 


## Author

**Fahid Attique** - https://github.com/fahidattique55
