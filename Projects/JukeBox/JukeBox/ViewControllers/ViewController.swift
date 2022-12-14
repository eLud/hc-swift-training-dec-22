//
//  ViewController.swift
//  JukeBox
//
//  Created by Ludovic Ollagnier on 13/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myPickerView: UIPickerView!

    @IBOutlet weak var speedSegmentedControl: UISegmentedControl!
    @IBOutlet weak var albumNameTextField: UITextField!
    @IBOutlet weak var isScratchedSwitch: UISwitch!

    var library: Library?

    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerView.delegate = self
        myPickerView.dataSource = self

        configureUI()
    }

    private func configureUI() {
        configureSegmentedControl()
    }

    private func configureSegmentedControl() {
        speedSegmentedControl.removeAllSegments()

        let allSpeeds = Vinyl.Speed.allCases
        for speed in allSpeeds {
            speedSegmentedControl.insertSegment(withTitle: speed.title, at: speedSegmentedControl.numberOfSegments, animated: false)
        }
        speedSegmentedControl.selectedSegmentIndex = 0
    }

    @IBAction func saveVinyl(_ sender: UIButton) {
        guard let name = albumNameTextField.text, !name.isEmpty else { return }
        let scratched = isScratchedSwitch.isOn
        let allSpeeds = Vinyl.Speed.allCases
        let speed = allSpeeds[speedSegmentedControl.selectedSegmentIndex]

        let vinyl = Vinyl(albumName: name, artist: "unknown", releaseDate: Date.now, numberInSerie: nil, titles: [], scratched: scratched, speed: speed)
        library?.add(vinyl)
        dismiss(animated: true)
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

