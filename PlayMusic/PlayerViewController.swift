//
//  PlayerViewController.swift
//  PlayerViewController
//
//  Created by Nilesh Kumar on 06/01/22.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    public var position: Int = 0
    public var song : [Song] = []
    
    @IBOutlet var holder: UIView!
    
    var player: AVAudioPlayer?
    
    public let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    public let SongTitle: UILabel = {
        let songName = UILabel()
        songName.textAlignment = .center
        songName.numberOfLines = 0
        return songName
    }()
    
    public let artistName: UILabel = {
        let artist = UILabel()

        artist.textAlignment = .center
        artist.numberOfLines = 0
        return artist
    }()
    
    public let albumName: UILabel = {
        let album = UILabel()
        album.textAlignment = .center
        album.numberOfLines = 0
        return album
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0 {
            configure()
        }
    }
    
    func configure(){
        let songs = song[position]
        let urlString = Bundle.main.path(forResource: songs.trackname, ofType: "wav")
        
        guard let urlString = urlString else {
            return
        }

        do{
            
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            try AVAudioSession.sharedInstance().setMode(.default)
            
            player = try AVAudioPlayer.init(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = player else {
                return
            }
            player.play()
            player.volume = 0.5
            
        } catch{
            print ("error occured")
        }
        
        albumImageView.frame = CGRect(x: 10, y: 10, width: holder.frame.size.width - 20, height: holder.frame.size.height - 20)
        holder.addSubview(albumImageView)
        //albumImageView.image = UIImage(named: songs.imageName)
        
        SongTitle.frame = CGRect(x: 10, y: albumImageView.frame.size.height + 10, width: holder.frame.size.width - 20, height: 70)
        holder.addSubview(SongTitle)
        SongTitle.text = songs.SongTitle
        
        artistName.frame = CGRect(x: 10, y: albumImageView.frame.size.height + 10 + 70, width: holder.frame.size.width - 20, height: 70)
        holder.addSubview(artistName)
        artistName.text = songs.artistName
        
        albumName.frame = CGRect(x: 10, y: albumImageView.frame.size.height + 10 + 140, width: holder.frame.size.width - 20, height: 70)
        holder.addSubview(albumName)
        albumName.text = songs.albumName
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let player = player {
            player.stop()
        }
    }
    

}
