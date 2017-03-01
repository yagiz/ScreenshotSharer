# ScrollTo
ScrollTo is a little UIScrollView and UIView extension that enables to scroll through the scroll view until the given view is at a particular location on the screen. It doesn't matter if given view is in a complicated hiearchy. ScrollTo calculates the position of the view according to scroll view coordinate. It basically mimicks the behaviour of the ```scrollToRow(at:at:animated:)``` method of UITableView.

### Installation

#### CocoaPods
```sh
pod 'ScrollTo', '~> 0.1.2'
```
#### Manually
Just download or clone the repo and move ScrollTo.swift file to your project.

### Usage
You can call ```scrollTo``` method from classes that are subclasses of UIScrollView. There is no control if given view is actually contained by scroll view. Be sure that it's indeed contained by scroll view.
#### UIScrollView (UITableView, UICollectionView)
```swift
scrollView.scrollTo(view:UIView, position:ScrollToPosition)
scrollView.scrollTo(view:UIView, position:ScrollToPosition, margin:CGFloat)
scrollView.scrollTo(view:UIView, position:ScrollToPosition, margin:CGFloat,animated:Bool)
```

#### UIView 
You don't need to store reference of the scroll view. ScrollTo finds the first scroll view that contains the view. This is very useful for custom cells and textfields.
```swift
view.scrollTo(position:ScrollToPosition)
view.scrollTo(position:ScrollToPosition, margin:CGFloat)
view.scrollTo(position:ScrollToPosition, margin:CGFloat,animated:Bool)
```
For example, if you want to center the text fields of a form when they do begin editing, you can write something like this:
```swift
func textFieldDidBeginEditing(_ textField: UITextField)
{
    textField.scrollTo(position: .middle)
}
```
If you want to use custom animation, you can call scrollTo method in animation block with animated argument is false:
```swift
UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
    self.scrollView.scrollTo(view: view, position: .middle, margin: 0, animated: false)
}) { (Bool) in
            
}
```

License
----
MIT

**Free Software, Hell Yeah!**