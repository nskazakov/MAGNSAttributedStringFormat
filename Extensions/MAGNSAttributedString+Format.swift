import Foundation

extension NSAttributedString {
    
    public func attributedStringWith(format: NSString, arguments: NSMutableAttributedString...) -> NSAttributedString {
        let result = self.initWith(format: format, arguments: arguments)
        return result
    }
    
    public func attributedStringWith(attributes: [NSAttributedStringKey : Any], format: NSString, arguments: NSMutableAttributedString...) -> NSAttributedString {
        let result = self.initWith(attributes: attributes, format: format as String, arguments: arguments)
        return result
    }
    
    private func initWith(format: NSString, arguments: [NSMutableAttributedString]) -> NSAttributedString {
        let result = self.initWith(attributes: nil, format: format as String, arguments: arguments)
        return result
    }
    
    private func initWith(attributes: [NSAttributedStringKey : Any]?, format: String, arguments: [NSMutableAttributedString]) -> NSAttributedString {
        var attributedString = NSMutableAttributedString()
        if let attribute = attributes {
            attributedString = NSMutableAttributedString(string: format, attributes: attribute)
        } else {
            attributedString = NSMutableAttributedString(string: format)
        }
        
        attributedString.beginEditing()
        
        let maxPosition = arguments.count
        let parseResult = FormatStringParses()
        let parseResults = parseResult.formatStringParser(format: format as NSString, maxPosition: maxPosition)
            .sorted(by: { (lhs, rhs) -> Bool in
                return lhs.range.location < rhs.range.location
            })
        
        var index = 0
        var attributeStringArray = [NSMutableAttributedString]()
        
        for _ in index..<maxPosition {
            index += 1
            for argument in arguments {
                attributeStringArray.append(argument)
            }
        }
        
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
                
                attributedString.replaceCharacters(in: parseResult.range, with: arg)
            } else {
                attributedString.replaceCharacters(in: parseResult.range, with: arg.description)
            }
        }
        attributedString.endEditing()

        return NSMutableAttributedString(attributedString: attributedString)
    }
}
