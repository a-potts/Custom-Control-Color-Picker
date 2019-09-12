//
//  ViewController.swift
//  ColorPicker
//
//  Created by Austin Potts on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorPicker: ColorPicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func changeColor(_ sender: Any) {
        view.backgroundColor = colorPicker.selectedColor
    }
}

