//
//  ViewController.swift
//  JukeBox
//
//  Created by Ludovic Ollagnier on 13/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myPickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.)

        myPickerView.delegate = self
        myPickerView.dataSource = self
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 10
        }
        return 5
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Ligne \(row) comp \(component)"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Picker did select \(row) in comp \(component)")
    }
}

