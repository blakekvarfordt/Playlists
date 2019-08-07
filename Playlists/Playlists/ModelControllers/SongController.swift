//
//  SongController.swift
//  Playlists
//
//  Created by Blake kvarfordt on 8/6/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    static let shared = SongController()
    
    func createSongWith(title: String, artist: String, playlist: Playlist) {
        let _ = Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.shared.saveToPersistentStore()
    }
    
    func delete(song: Song) {
        let moc = CoreDataStack.context
        moc.delete(song)
        PlaylistController.shared.saveToPersistentStore()
    }
}
