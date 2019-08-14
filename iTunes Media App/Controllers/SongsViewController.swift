//
//  SongsViewController.swift
//  iTunes Media App
//
//  Created by Alfredo Merino on 8/3/19.
//  Copyright © 2019 Amerino. All rights reserved.
//

import Foundation
import UIKit

class SongsViewController: UIViewController {
    var songs = [Song]()
    // Why lazy?:
    lazy var tableView: UITableView = {
        // Does this create the initial view? What does view.frame do?
        let tableView = UITableView(frame: view.frame)
        // This allows you to provide all of the constraints you want,
        // but you must provide all of the constraints without issues.
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // Why declare delegate here?
        tableView.delegate = self // datasource/delegate
        tableView.dataSource = self
        // Why do you need ReuseIdentifier ? What does this do ?
        // This points the tableView to the correct Cell right?
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: SongTableViewCell.reuseID) // registering cell
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Top Songs"
        // TODO: refactor numberOfSongs to be an int
        // maybe an enum?
        // What does error in DispatchQueue do here? Why is it here?
        // Why arent any other things from the Song.wift file being called here ?
        iTunesAPI.fetchData(numberOfSongs: "25") { songsArray, error in
            DispatchQueue.main.async {
                self.songs = songsArray
                // Why do you need to reloadData() here?
                self.tableView.reloadData()
            }
        }
        // What the fcck is a Subview anyway? Why is it being called here?
        view.addSubview(tableView)
        
        view.addConstraints([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}
// Why does the viewController need to be extended anyway?
extension SongsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // How do you know to do as! ? How/why do you know to add withIdentifier ?
        let cell = tableView.dequeueReusableCell(withIdentifier: SongTableViewCell.reuseID, for: indexPath) as! SongTableViewCell
        let song = songs[indexPath.row]
        // Why do you use configure here anyway? 
            // Why is this line not good anymore ? Is it because we use configure?
//        cell.textLabel?.text = song.name

        cell.configure(song)

        return cell
    }
}
