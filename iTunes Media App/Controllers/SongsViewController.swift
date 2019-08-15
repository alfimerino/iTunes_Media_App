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
        
        view.addSubview(tableView)
        
        navigationItem.title = "Top Songs"
        iTunesAPI.fetchData(numberOfSongs: "25") { songsArray, error in
            DispatchQueue.main.async {
                self.songs = songsArray
                
                self.tableView.reloadData()
            }
        }

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
//        let imageView: UIImageView
//        imageView = UIImageView(frame:CGRect(x: 0, y: 0, width: 20, height: 20))
//        imageView.image = UIImage(imageLiteralResourceName: "fav_star")
//        imageView.contentMode = .scaleAspectFit
//        cell.accessoryView = imageView
        cell.accessoryType = .none

        cell.configure(song)
        return cell
    }
    
    func accessoryButtonTapped(_ sender: UIButton) {
        let imageView: UIImageView
        imageView = UIImageView(frame:CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(imageLiteralResourceName: "fav_star")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .red
        print("Button Pressed")
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if tableView.cellForRow(at: indexPath)?.accessoryView == UIImageView(image: #imageLiteral(resourceName: "star-8-48")) {
//            tableView.cellForRow(at: indexPath)?.accessoryView = UIImageView(image: #imageLiteral(resourceName: "fav_star"))
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryView = UIImageView(image: #imageLiteral(resourceName: "star-8-48"))
//        }
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        
    }
    
}
