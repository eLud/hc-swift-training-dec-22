//
//  VinylDetailsViewController.swift
//  JukeBox
//
//  Created by Ludovic Ollagnier on 14/12/2022.
//

import UIKit

class VinylDetailsViewController: UIViewController {

    @IBOutlet weak var detailsLabel: UILabel!

    var vinyl: Vinyl?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
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
