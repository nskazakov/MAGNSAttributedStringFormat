//
//  ViewController.swift
//  MAGNSAttributedStringFormat
//
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
        self.testAttributedFormatString()
    }
    
    
    func testAttributedFormatString() {
        let blue = NSAttributedString(string: "blue", attributes: [
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
                NSAttributedStringKey.foregroundColor: UIColor.blue
            ])

        let green = NSAttributedString(string: "green", attributes: [
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
                NSAttributedStringKey.foregroundColor: UIColor.green
            ])

        let red = NSAttributedString(string: "11111", attributes: [
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
                NSAttributedStringKey.foregroundColor: UIColor.red
            ])

        let attr = NSAttributedString.attributedStringWith(format: "%@My favorite color is %@ an %@, not is %@", arguments: red, blue, green)

        
        let underlineStringTest = NSMutableAttributedString(string: "Nikita", attributes: [
                NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue,

                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
                NSAttributedStringKey.foregroundColor: UIColor.gray
            ])

        let attribute = NSAttributedString.attributedStringWith(attributes: [
                                                                        NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 32),
                                                                        NSAttributedStringKey.foregroundColor: UIColor.purple
                                                                ],
                                                                format: "My name is %@. My name need underline", arguments: underlineStringTest)
        
        self.descriptionLabel.attributedText = attribute
        self.textView.attributedText = attr

        
    }

}

