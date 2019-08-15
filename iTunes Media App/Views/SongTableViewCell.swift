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
    static let reuseID = String(describing: self)
    
    private lazy var songNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        //lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private lazy var artistNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont(name: "HelveticaNeue", size: 14)
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
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackView)
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
