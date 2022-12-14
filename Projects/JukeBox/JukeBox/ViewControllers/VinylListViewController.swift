//
//  VinylListViewController.swift
//  JukeBox
//
//  Created by Ludovic Ollagnier on 14/12/2022.
//

import UIKit

class VinylListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let library = Library()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        library.add(Vinyl(albumName: "Vinyl 1", artist: "Artiste", releaseDate: .now, numberInSerie: nil, titles: [], scratched: false, speed: .rpm33))

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(forName: NSNotification.Name("LibraryDidChange"), object: library, queue: OperationQueue.main) { _ in
            self.tableView.reloadData()
        }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.

        if segue.identifier == "showForm" {
            let destination = segue.destination as? ViewController
            destination?.library = library
        } else if segue.identifier == "showDetails" {
            let destination = segue.destination as? VinylDetailsViewController

//            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            guard let sender = sender, let cell = sender as? UITableViewCell else { return }
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            destination?.vinyl = library.vinyls[indexPath.row]
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

}

extension VinylListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        library.vinyls.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "vinylCell", for: indexPath)

        let vinyl = library.vinyls[indexPath.row]
        let title = vinyl.albumName
        let artist = vinyl.artist

        // iOS > 14
        var content = cell.defaultContentConfiguration()
        content.text = title
        content.secondaryText = artist
        cell.contentConfiguration = content

        // iOS < 14
//        cell.textLabel?.text = title
//        cell.detailTextLabel?.text = artist

        return cell
    }
}

extension VinylListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "My Vinyls"
        case 1:
            return "Borrowed Vinyls"
        default:
            return nil
        }
    }
}
