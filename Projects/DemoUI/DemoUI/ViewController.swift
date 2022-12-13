//
//  ViewController.swift
//  DemoUI
//
//  Created by Ludovic Ollagnier on 13/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sayHelloButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func sayHello(_ sender: UIButton) {
        nameLabel.text = "Hello"
        sender.backgroundColor = UIColor.green
    }
}

