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
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.delegate = self // datasource/delegate
        tableView.dataSource = self
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: SongTableViewCell.reuseID) // registering cell
        return tableView
    }()
    
    lazy var artistName: UITableView = {
        let artistName = UITableView(frame: view.frame)
        artistName.translatesAutoresizingMaskIntoConstraints = false
        artistName.rowHeight = UITableView.automaticDimension
        artistName.estimatedRowHeight = 80
        artistName.delegate = self // datasource/delegate
        artistName.dataSource = self
        artistName.register(SongTableViewCell.self, forCellReuseIdentifier: SongTableViewCell.reuseID) // registering cell
        return artistName
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Top Songs"
        // TODO: refactor numberOfSongs to be an int
        // maybe an enum?
        iTunesAPI.fetchData(numberOfSongs: "25") { songsArray, error in
            DispatchQueue.main.async {
                self.songs = songsArray
                self.tableView.reloadData()
                self.artistName.reloadData()
            }
        }
        
        view.addSubview(tableView)
        view.addSubview(artistName)
        
        view.addConstraints([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        view.addConstraints([
            artistName.topAnchor.constraint(equalTo: view.topAnchor),
            artistName.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            artistName.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            artistName.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension SongsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongTableViewCell.reuseID, for: indexPath)
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        
        
        return cell
    }
}
