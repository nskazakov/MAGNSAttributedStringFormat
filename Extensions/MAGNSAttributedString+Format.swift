//  Created by Nikita Kazakov on 11/09/2017.
//  Copyright (c) 2017 Nikita Kazakov. All rights reserved.
//

import Foundation

extension NSAttributedString {
    

    class public func attributedStringWith(format: NSString, arguments: NSAttributedString...) -> NSAttributedString {
        let result = NSAttributedString().changeAttributedString(attributes: nil, format: format as String, arguments: arguments)
        return result
    }
    
    class public func attributedStringWith(attributes: [NSAttributedStringKey : Any], format: NSString, arguments: NSAttributedString...) -> NSAttributedString {
        let result = NSAttributedString().changeAttributedString(attributes: attributes, format: format as String, arguments: arguments)
        return result
    }
    
    private func changeAttributedString(attributes: [NSAttributedStringKey : Any]?, format: String, arguments: [NSAttributedString]) -> NSAttributedString {
        var attributedString = NSMutableAttributedString()
        if let attribute = attributes {
            attributedString = NSMutableAttributedString(string: format, attributes: attribute)
        } else {
            attributedString = NSMutableAttributedString(string: format)
        }
        
        attributedString.beginEditing()
        
        let parseResult = FormatStringParses()
        let parseResults = parseResult.formatStringParser(format: format as NSString, maxPosition: arguments.count)
            .sorted(by: { (lhs, rhs) -> Bool in
                return rhs.range.location < lhs.range.location
            })
        
        var attributeStringArray = [NSMutableAttributedString]()
        for argument in arguments {
            let mutableString = NSMutableAttributedString(attributedString: argument)
            attributeStringArray.append(mutableString)
        }
        
        self.compareCountAttributedStrings(formatParseResultsCount: parseResults.count, attributesCount: attributeStringArray.count)
        for result in parseResults {
            var arg = attributeStringArray[result.index]
            
            if arg.isKind(of: NSAttributedString.superclass()!) {
                if let attribute = attributes {
                    let argCopy: NSMutableAttributedString = arg.mutableCopy() as! NSMutableAttributedString
                    argCopy.setAttributes(attribute, range: NSMakeRange(0, argCopy.length))
                    
                    arg.enumerateAttributes(in: NSMakeRange(0, argCopy.length),
                                            options: .reverse,
                                            using: { (attr, range, stop) in
                                                argCopy.addAttributes(attr, range: range)
                    })
                    arg = argCopy
                    
                }
                
                attributedString.replaceCharacters(in: result.range, with: arg)
            } else {
                attributedString.replaceCharacters(in: result.range, with: arg.description)
            }
        }
        attributedString.endEditing()

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
