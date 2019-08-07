//
//  SongTableViewController.swift
//  Playlists
//
//  Created by Blake kvarfordt on 8/6/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {

    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var songArtistTextField: UITextField!
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = playlist?.name ?? ""
    }

    // MARK: - Table view data source

    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard let songTitle = songTitleTextField.text, let artist = songArtistTextField.text, let playlist = self.playlist else { return }
        
        SongController.shared.createSongWith(title: songTitle, artist: artist, playlist: playlist)
        tableView.reloadData()
        songTitleTextField.text = ""
        songArtistTextField.text = ""
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlist?.songs?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
        guard let song = playlist?.songs?.object(at: indexPath.row) as? Song else { return UITableViewCell() }
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artist

        return cell
    }


    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let song = playlist?.songs?.object(at: indexPath.row) as? Song else { return }
            SongController.shared.delete(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
