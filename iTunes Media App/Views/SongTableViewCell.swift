//
//  SongTableViewCell.swift
//  iTunes Media App
//
//  Created by Alfredo Merino on 8/3/19.
//  Copyright © 2019 Amerino. All rights reserved.
//

import Foundation
import UIKit

class SongTableViewCell: UITableViewCell {
    // How do you declare dynamic if this is static? Does that even exist?
    // Why describing?
    static let reuseID = String(describing: self)
    // Why lazy ? 
    private lazy var songNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private lazy var artistNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private lazy var genreLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private lazy var lengthLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [songNameLabel, artistNameLabel, genreLabel, lengthLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Cells have content view instead of Views
        // Why? How do you know this?
        contentView.addSubview(stackView)
        // Why does content view an additional set of constraints? 
        contentView.addConstraints([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
    
    func configure(_ song: Song) {
//        lengthLabel.text = song.imageURL
        songNameLabel.text = song.name
        artistNameLabel.text = song.artistName
//        genreLabel.text = song.genreName
    }
    // Why is this a required init?
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



