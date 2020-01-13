//
//  ViewController.swift
//  Landmarks
//
//  Created by Joonas Leminen on 10/01/2020.
//  Copyright © 2020 Joonas Leminen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LabelMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonMessage(_ sender: Any) {
        LabelMessage.text = "Hello Swift!";
    }
    
}

