//
//  VinylDetailsViewController.swift
//  JukeBox
//
//  Created by Ludovic Ollagnier on 14/12/2022.
//

import UIKit
import SwiftUI

class VinylDetailsViewController: UIViewController {

    @IBOutlet weak var detailsLabel: UILabel!

    var vinyl: Vinyl?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    @IBAction func showSwiftUIComponent(_ sender: Any) {

        let controller = UIHostingController(rootView: AVeryNiceSwiftUIView())
        let swiftUIview = controller.view

        if let swiftUIview {
            view.addSubview(swiftUIview)
            swiftUIview.translatesAutoresizingMaskIntoConstraints = false
            swiftUIview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            swiftUIview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
//        present(controller, animated: true)
    }

    private func configureUI() {
        guard let vinyl else {
            view.backgroundColor = .red
            return
        }

        self.title = vinyl.albumName
        detailsLabel.text = vinyl.albumName
    }
}
