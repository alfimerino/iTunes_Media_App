//
//  SongsViewController.swift
//  iTunes Media App
//
//  Created by gnoa001 on 8/3/19.
//  Copyright © 2019 Amerino. All rights reserved.
//

import Foundation
import UIKit

//
class SongsViewController: UIViewController {
    var songs = [Song]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame)
        tableView.delegate = self // datasource/delegate
        tableView.dataSource = self
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: SongTableViewCell.reuseID) // registering cell
        return tableView
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
        let cell = tableView.dequeueReusableCell(withIdentifier: SongTableViewCell.reuseID, for: indexPath)
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        return cell
    }
}
