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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testAttributedFormatString()
    }
    
    
    func testAttributedFormatString() {
        let blue = NSMutableAttributedString(string: "blue", attributes: [
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 13),
            NSAttributedStringKey.foregroundColor: UIColor.blue
            ])
        
        let green = NSMutableAttributedString(string: "green", attributes: [
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 13),
            NSAttributedStringKey.foregroundColor: UIColor.green
            ])
        
        let red = NSMutableAttributedString(string: "red", attributes: [
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 13),
            NSAttributedStringKey.foregroundColor: UIColor.red
            ])
        
        let attr = NSAttributedString().attributedStringWith(format: "My favorite colors is %@ and %@, but not %@", arguments: red, blue, green)

        self.descriptionLabel.attributedText = attr
    }

}

