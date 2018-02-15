//  Created by Nikita Kazakov on 11/09/2017.
//  Copyright (c) 2017 Nikita Kazakov. All rights reserved.
//

import Foundation

enum FormatStringState: Int {
    case FormatStringStateUnknown
    case FormatStringStartFormat
    case FormatStringStatePositional
    case FormatStringStateEndPositional
}

protocol FormatParseResult {
    var range: NSRange {get set}
    var index: Int {get set}
    
}

class FormatParseResultImplementation: FormatParseResult {
    var range: NSRange = NSRange()
    var index = 0
    
    init(range: NSRange, index: Int) {
        self.range = range
        self.index = index
    }
}

class FormatStringParses {
    var range = NSRange()
    var index = 0
    
    public func formatStringParser(format: NSString, maxPosition: Int) -> [FormatParseResult] {
        var arguments = [FormatParseResult]()
        var position = 0
        var start: Int = NSNotFound
        var positionString: NSString? = nil
        var state: FormatStringState = .FormatStringStateUnknown
        
        var index = 0
        
        for _ in 0..<format.length {
            var un = format.character(at: index)
            let unicharString = UnicodeScalar(un)
            
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
                    let result = FormatParseResultImplementation(range: NSMakeRange(start, (index + 1) - start), index: currentPosition)
                    self.range = NSMakeRange(start, (index + 1) - start)
                    self.index = currentPosition
                    
                    if maxPosition > arguments.count {
                        arguments.append(result)
                    }
                    state = .FormatStringStateUnknown
                } else if (state == .FormatStringStartFormat || state == .FormatStringStatePositional) && (un >= 0 && un <= 9) {
                    if positionString == nil {
                        positionString = NSString(characters: &un, length: 1)
                    } else {
                        positionString?.appending(NSString(characters: &un, length: 1) as String)
                    }
                    state = .FormatStringStatePositional
                } else if (state == .FormatStringStatePositional && unicharString == "$") {
                    state = .FormatStringStateEndPositional
                } else {
                    state = .FormatStringStateUnknown
                }
            }
            index += 1
        }
        return arguments
    }
}
