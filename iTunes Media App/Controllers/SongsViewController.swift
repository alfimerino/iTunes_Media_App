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
    // MARK: - Properties
    lazy var tableView: UITableView = {
        
        let tableView = UITableView(frame: view.frame)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // MARK: - Data Source
        tableView.delegate = self // datasource/delegate
        tableView.dataSource = self
        
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: SongTableViewCell.reuseID) // registering cell
        return tableView
    }()
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        tableView.estimatedRowHeight = 60
        
        view.addSubview(tableView)
        
        navigationItem.title = "Top Songs"
        iTunesAPI.fetchData(numberOfSongs: "25") { songsArray, error in
            DispatchQueue.main.async {
                self.songs = songsArray
                
                self.tableView.reloadData()
            }
        }

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}
// MARK: - Methods
extension SongsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongTableViewCell.reuseID, for: indexPath) as! SongTableViewCell
        let song = songs[indexPath.row]
        cell.accessoryType = .none
        
        cell.configure(with: song)
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    
    
}
