import Foundation

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
