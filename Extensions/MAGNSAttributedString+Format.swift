import Foundation

enum FormatStringState: Int {
    case FormatStringStateUnknown
    case FormatStringStartFormat
    case FormatStringStatePositional
    case FormatStringStateEndPositional
}

protocol FormatParseResult {
//    var range: NSRange {get}
//    var index: Int {get}
    
    func formatStringParser(format: NSString, maxPosition: Int) -> [NSMutableArray]
}

class FormatParseResultImplementation: FormatParseResult {
    var range: NSRange = NSRange()
    var index = 0
    
    
    init(range: NSRange, index: Int) {
        self.range = range
        self.index = index
    }
    
    func formatStringParser(format: NSString, maxPosition: Int) -> [NSMutableArray] {
        var arguments: [NSMutableArray] = []
        var position = 0
        var start: Int = NSNotFound
        var positionString: NSMutableString? = nil
        var state: FormatStringState = .FormatStringStateUnknown
        
        for _ in 0..<format.length {
            index += 1
            var unichar = format.character(at: index)
            let unicharString = "\(unichar)"
            
            if (unicharString == "%") {
                start = index
                state = .FormatStringStartFormat
            } else if (state != .FormatStringStateUnknown) {
                if unicharString == "@" {
                    var currentPosition = 0
                    if positionString == nil {
                        currentPosition = position
                        position += 1
                    } else {
                        if positionString?.integerValue != nil {
                            currentPosition = (positionString?.integerValue)! - 1
                            positionString = nil
                        }
                    }
                    let result = [FormatParseResultImplementation.init(range: NSMakeRange(start, (index + 1) - start), index: currentPosition)]
                    arguments.append(result as! NSMutableArray)
                    state = .FormatStringStateUnknown
                } else if (state == .FormatStringStartFormat || state == .FormatStringStatePositional) && (unichar >= 0 && unichar <= 9) {
                    if positionString == nil {
                        positionString = NSMutableString.init(characters: &unichar, length: 1)
                    } else {
                        positionString?.append(NSMutableString.init(characters: &unichar, length: 1) as String)
                    }
                    state = .FormatStringStatePositional
                } else if (state == .FormatStringStatePositional && unicharString == "$") {
                    state = .FormatStringStateEndPositional
                } else {
                    state = .FormatStringStateUnknown
                }
            }
        }
        return arguments
    }
}

extension NSAttributedString {
    
    private func initWith(attributes: NSDictionary, format: String, arguments: va_list) -> NSAttributedString {
        var attributedString = NSMutableAttributedString()
        attributedString = NSMutableAttributedString.init(string: format, attributes: attributes as? [NSAttributedStringKey : Any])
        attributedString.beginEditing()
        
        var maxPosition = 0
        var parseResult: FormatParseResult!
        parseResult.formatStringParser(format: format as NSString, maxPosition: maxPosition)
        
        

        return NSAttributedString.init(attributedString: attributedString)
    }
}
