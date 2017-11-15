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
        let blue = NSMutableAttributedString(string: "blue", attributes: [
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
                NSAttributedStringKey.foregroundColor: UIColor.blue
            ])
        
        let green = NSMutableAttributedString(string: "green", attributes: [
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
                NSAttributedStringKey.foregroundColor: UIColor.green
            ])
        
        let red = NSMutableAttributedString(string: "11111", attributes: [
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
                NSAttributedStringKey.foregroundColor: UIColor.red
            ])
        
        let attr = NSAttributedString.attributedStringWith(format: "", arguments: red, blue, green)
        
        
        let underlineStringTest = NSMutableAttributedString(string: "Nikita", attributes: [
//                NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleDouble,
            
                NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 23),
                NSAttributedStringKey.foregroundColor: UIColor.gray
            ])

        let attribute = NSAttributedString.attributedStringWith(format: "My name is %@. My name need underline", arguments: underlineStringTest)
//        self.testLabel.attributedText = attribxute
        self.descriptionLabel.attributedText = attr
        self.textView.attributedText = attribute

        
    }

}

