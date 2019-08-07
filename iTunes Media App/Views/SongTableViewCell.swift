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
    // instance property means you NEED an instantiated object to use it
    // use static when you aren't creating the object just yet
    static let reuseID = String(describing: self)
    
    private lazy var mediaImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var artistName: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.adjustsFontForContentSizeCategory = true
        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()
}
