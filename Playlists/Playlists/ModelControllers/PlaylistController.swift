//
//  PlaylistController.swift
//  Playlists
//
//  Created by Blake kvarfordt on 8/6/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let shared = PlaylistController()
    
    var playlists: [Playlist] {
        let moc = CoreDataStack.context
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        return (try? moc.fetch(request)) ?? []
    }
    
    func createPlaylistWith(name: String) {
        _ = Playlist(name: name)
        saveToPersistentStore()
    }
    
    func delete(playlist: Playlist) {
        let moc = CoreDataStack.context
        moc.delete(playlist)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch {
            print("Error saving to persistent store \(error.localizedDescription)")
        }
    }
    
    
    
}
