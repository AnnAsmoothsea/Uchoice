//
//  MovieViewController.swift
//  ShiXun
//
//  Created by student on 2018/12/28.
//  Copyright © 2018年 lilu. All rights reserved.
//

import UIKit
import MediaPlayer
class MovieViewController: UIViewController {

    var mediaPlayer:MPMoviePlayerController = MPMoviePlayerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "m1", ofType: "mp4")
        let movieUrl = URL(fileURLWithPath: path!)
        
        mediaPlayer = MPMoviePlayerController(contentURL: movieUrl)
        mediaPlayer.controlStyle = MPMovieControlStyle.fullscreen
        mediaPlayer.view.frame = self.view.bounds
        mediaPlayer.initialPlaybackTime = -1
        
        self.view.addSubview(mediaPlayer.view)
        
        NotificationCenter.default.addObserver(self, selector: #selector(MovieViewController.movieFinished(notify:)), name: .MPMoviePlayerPlaybackDidFinish, object: mediaPlayer)
        
        mediaPlayer.play()
    }
    
    @objc func movieFinished(notify:NSNotification){
        
        print("movie ends")
        let player = notify.object
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.MPMoviePlayerPlaybackDidFinish, object: player)
        
        
    }

}
