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
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: view.frame)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self // datasource/delegate
        tableView.dataSource = self
        
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: SongTableViewCell.reuseID) // registering cell
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Top Songs"
        iTunesAPI.fetchData(numberOfSongs: "25") { songsArray, error in
            DispatchQueue.main.async {
                self.songs = songsArray
                
                self.tableView.reloadData()
            }
        }
        view.addSubview(tableView)
        
        view.addConstraints([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension SongsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongTableViewCell.reuseID, for: indexPath) as! SongTableViewCell
        let song = songs[indexPath.row]

        // Added Accessory Button
        let imageView: UIImageView = UIImageView(frame:CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(imageLiteralResourceName: "fav_star")
        imageView.contentMode = .scaleAspectFit
        cell.accessoryView = imageView

        cell.configure(song)
        return cell
    }
}
