MAGNSAttributedStringFormat
=====================================================================

[![CI Status](http://img.shields.io/travis/Nikita Kazakov/MAGNSAttributedStringFormat.svg?style=flat)](https://travis-ci.org/Nikita Kazakov/MAGNSAttributedStringFormat)
[![Version](https://img.shields.io/cocoapods/v/MAGNSAttributedStringFormat.svg?style=flat)](http://cocoapods.org/pods/MAGNSAttributedStringFormat)
[![License](https://img.shields.io/cocoapods/l/MAGNSAttributedStringFormat.svg?style=flat)](http://cocoapods.org/pods/MAGNSAttributedStringFormat)
[![Platform](https://img.shields.io/cocoapods/p/MAGNSAttributedStringFormat.svg?style=flat)](http://cocoapods.org/pods/MAGNSAttributedStringFormat)

An extension to NSAttributedString for creating attributed strings by using a
given format string as a template into which the remaining argument values are
substituted. This is helpful for using in conjunction with internationalisation.

Use with attributes to set attributes for the entire string

```swift
NSAttributedString.attributedStringWith(attributes: [NSAttributedStringKey : Any], format: NSString, arguments: NSAttributedString...)
```

Use without attributes to set attributes only for arguments

```swift
NSAttributedString.attributedStringWith(format: NSString, arguments: NSAttributedString...)
```



## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Usage

```swift
one = NSAttributedString(string: "one", attributes: [
NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
NSAttributedStringKey.foregroundColor: UIColor.blue
])

two = NSAttributedString(string: "two", attributes: [
NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
NSAttributedStringKey.foregroundColor: UIColor.green
])

three = NSAttributedString(string: "three", attributes: [
NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
NSAttributedStringKey.foregroundColor: UIColor.red
])

etc = NSAttributedString(string: "etc", attributes: [
NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
NSAttributedStringKey.foregroundColor: UIColor.gray
])

result = NSAttributedString.attributedStringWith(format: "You can multiple (%@, %@, %@, %@) arguments with their attributes each of them", arguments: one, two, three, etc)
```


## Installation

MAGNSAttributedStringFormat is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

### Podfile

```ruby
pod 'MAGNSAttributedStringFormat'
```

## Author

Nikita Kazakov, kazakov@magora-systems.com

## License

MAGNSAttributedStringFormat is available under the MIT license. See the LICENSE file for more info.
