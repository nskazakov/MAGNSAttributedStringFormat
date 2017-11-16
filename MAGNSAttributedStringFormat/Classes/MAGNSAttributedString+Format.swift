//  Created by Nikita Kazakov on 11/09/2017.
//  Copyright (c) 2017 Nikita Kazakov. All rights reserved.
//

import Foundation

extension NSAttributedString {
    

    class public func attributedStringWith(format: NSString, arguments: NSAttributedString...) -> NSAttributedString {
        let result = self.changeAttributedString(attributes: nil, format: format, arguments: arguments)
        return result
    }
    
    class public func attributedStringWith(attributes: [NSAttributedStringKey : Any], format: NSString, arguments: NSAttributedString...) -> NSAttributedString {
        let result = self.changeAttributedString(attributes: attributes, format: format, arguments: arguments)
        return result
    }
    
    private class func changeAttributedString(attributes: [NSAttributedStringKey : Any]?, format: NSString, arguments: [NSAttributedString]) -> NSAttributedString {
        var attributedString = NSAttributedString()
        let str = String(format)
        if let attribute = attributes {
            attributedString = NSAttributedString(string: str, attributes: attribute as [String : Any])
        } else {
            attributedString = NSAttributedString(string: str)
        }
        let mutableString = NSMutableAttributedString(attributedString: attributedString)
//        attributedString.beginEditing()
        
        let parseResult = FormatStringParses()
        let parseResults = parseResult.formatStringParser(format: format, maxPosition: arguments.count)
            .sorted(by: { (lhs, rhs) -> Bool in
                return rhs.range.location < lhs.range.location
            })
        
        var attributeStringArray = [NSAttributedString]()
        for argument in arguments {
            let mutableString = NSMutableAttributedString(attributedString: argument)
            attributeStringArray.append(mutableString)
        }
        
        NSAttributedString().compareCountAttributedStrings(formatParseResultsCount: parseResults.count, attributesCount: attributeStringArray.count)
        for result in parseResults {
            var arg = attributeStringArray[result.index]
            if NSAttributedString.superclass() != nil {
                if arg.isKind(of: NSAttributedString.superclass()!) {
                    if let attribute = attributes {
                        let argCopy = arg.mutableCopy() as? NSMutableAttributedString
                        if argCopy != nil  {
                            argCopy?.setAttributes(attribute as [String : Any], range: NSMakeRange(0, (argCopy?.length)!))
                            
                            arg.enumerateAttributes(in: NSMakeRange(0, (argCopy?.length)!),
                                                    options: .reverse,
                                                    using: { (attr, range, stop) in
                                                        argCopy?.addAttributes(attr, range: range)
                            })
                            arg = argCopy!
                        }
                    }
                    
                    mutableString.replaceCharacters(in: result.range, with: arg)
                } else {
                    mutableString.replaceCharacters(in: result.range, with: arg.description)
                }
            }
        }
//        attributedString.endEditing()
        attributedString = NSAttributedString(attributedString: mutableString)
        return attributedString
    }
    
    private func compareCountAttributedStrings(formatParseResultsCount: Int, attributesCount: Int) {
        if formatParseResultsCount == attributesCount {
            print("Your attributes string count is equal format parse results count")
        } else if formatParseResultsCount < attributesCount {
            print("Your attributes string count is great format parse results count")
        } else if formatParseResultsCount > attributesCount {
            print("Your attributes string count is less format parse results count")
        }
    }
}
