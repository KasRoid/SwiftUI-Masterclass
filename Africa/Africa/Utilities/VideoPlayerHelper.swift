//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Kas Song on 2021/04/06.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else { fatalError() }
    videoPlayer = AVPlayer(url: url)
    videoPlayer?.play()
    return videoPlayer!
}
