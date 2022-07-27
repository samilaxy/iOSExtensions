//
//  VideoPlayHelper.swift
//  AegisRider-iOS
//
//  Created by Abdul Suraj on 18/11/2021.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(url: String) -> AVPlayer {
    videoPlayer = AVPlayer(url: URL(string: url)!)
    videoPlayer?.play()
  return videoPlayer!
}
