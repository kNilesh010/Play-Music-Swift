//
//  ViewController.swift
//  PlayMusic
//
//  Created by Nilesh Kumar on 05/01/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var player: AVAudioPlayer?
    
    @IBOutlet var table: UITableView!
    
    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        configure()
        
    }
    
    func configure(){
        songs.append(Song(SongTitle: "Test", albumName: "Test", artistName: "Test", imageName: "image_1", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test2", albumName: "Test2", artistName: "Test2", imageName: "image_2", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test3", albumName: "Test3", artistName: "Test3", imageName: "image_1", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test4", albumName: "Test4", artistName: "Test4", imageName: "image_2", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test", albumName: "Test", artistName: "Test", imageName: "image_1", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test2", albumName: "Test2", artistName: "Test2", imageName: "image_2", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test3", albumName: "Test3", artistName: "Test3", imageName: "image_1", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test4", albumName: "Test4", artistName: "Test4", imageName: "image_2", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test", albumName: "Test", artistName: "Test", imageName: "image_1", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test2", albumName: "Test2", artistName: "Test2", imageName: "image_2", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test3", albumName: "Test3", artistName: "Test3", imageName: "image_1", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test4", albumName: "Test4", artistName: "Test4", imageName: "image_2", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test", albumName: "Test", artistName: "Test", imageName: "image_1", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test2", albumName: "Test2", artistName: "Test2", imageName: "image_2", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test3", albumName: "Test3", artistName: "Test3", imageName: "image_1", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test4", albumName: "Test4", artistName: "Test4", imageName: "image_2", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test", albumName: "Test", artistName: "Test", imageName: "image_1", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test2", albumName: "Test2", artistName: "Test2", imageName: "image_2", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test3", albumName: "Test3", artistName: "Test3", imageName: "image_1", trackname: "mixkit-689"))
        songs.append(Song(SongTitle: "Test4", albumName: "Test4", artistName: "Test4", imageName: "image_2", trackname: "mixkit-689"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.SongTitle
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let position = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "open") as? PlayerViewController else {return}
        vc.song = songs
        vc.position = position
        present(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}


struct Song{
    
    let SongTitle: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackname: String
    
    
}
