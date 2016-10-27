//: [Previous](@previous)

import UIKit

class MediaItem {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michal Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "Tje One And Only", artist: "Chesny Hawkes"),
    Song(name: "Never Gonna Give", artist: "Rick Astley")
]

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
    
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}
print("Media library contains \(movieCount) movies and \(songCount) songs")

var things = [Any]()
things.append(0)
things.append("hello")
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman")
//things.append({ (name: String) -> String in
//        "Hello, \(name)"
//})


//: [Next](@next)
