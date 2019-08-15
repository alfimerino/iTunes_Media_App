//
//  iTunesAPI.swift
//  iTunes Media App
//
//  Created by Alfredo Merino on 8/3/19.
//  Copyright © 2019 Amerino. All rights reserved.
//

import Foundation

// Explain this whole thing..
struct iTunesAPI {
    static func fetchData(numberOfSongs: String, completion: @escaping ([Song], Error?) -> Void) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-songs/all/\(numberOfSongs)/explicit.json"
        let url = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                error == nil else {
                    completion([], error)
                    return
            }
            
            do {
                struct Welcome: Codable {
                    let feed: Feed
                }
                
                struct Feed: Codable {
                    let results: [Result]
                }
                
                struct Result: Codable {
                    let artistName: String
                    let name: String
                    let artworkUrl100: String
//                    let genreName: String
                }
                
                let welcomeData = try JSONDecoder().decode(Welcome.self, from: data)
                
                let mediaItems = welcomeData.feed.results.map { Song(artistName: $0.artistName, name: $0.name, imageURL: $0.artworkUrl100) }
                print(mediaItems)
                completion(mediaItems, error)
                
            } catch let decodingError {
                completion([], decodingError)
            }
        }.resume()
    }
}
