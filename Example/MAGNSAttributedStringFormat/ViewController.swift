//  Created by Nikita Kazakov on 11/09/2017.
//  Copyright (c) 2017 Nikita Kazakov. All rights reserved.
//

import UIKit
import MAGNSAttributedStringFormat

class ViewController: UIViewController {


    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testAttributedStringFormat()
        self.testAttributedStringFormatWithAttributes()
    }
    
//    Use without attributes to set attributes only for arguments
    
    func testAttributedStringFormat() {
        
        let one = NSAttributedString(string: "one", attributes: [
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
                NSAttributedStringKey.foregroundColor: UIColor.blue
            ])

        let two = NSAttributedString(string: "two", attributes: [
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
                NSAttributedStringKey.foregroundColor: UIColor.green
            ])

        let three = NSAttributedString(string: "three", attributes: [
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
                NSAttributedStringKey.foregroundColor: UIColor.red
            ])
        
        let etc = NSAttributedString(string: "etc", attributes: [
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
                NSAttributedStringKey.foregroundColor: UIColor.gray
            ])

        let attributedString = NSAttributedString.attributedStringWith(format: "You can multiple (%@, %@, %@ %@) arguments with their attributes each of them", arguments: one, two, three, etc)

        self.descriptionLabel.attributedText = attributedString
    }
    
//        Use with attributes to set attributes for the entire string

    func testAttributedStringFormatWithAttributes() {
        
        let underlineStringTest = NSMutableAttributedString(string: "Nikita", attributes: [
                                                                                NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue,
                                                                                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
                                                                                NSAttributedStringKey.foregroundColor: UIColor.gray
                                                                            ])
        
        let attributedString = NSAttributedString.attributedStringWith(attributes: [
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 32),
                                                                    NSAttributedStringKey.foregroundColor: UIColor.purple
                                                                ],
                                                                format: "My name is %@. My name needs to be emphasize", arguments: underlineStringTest)
        
        self.textView.attributedText = attributedString
    }

}

