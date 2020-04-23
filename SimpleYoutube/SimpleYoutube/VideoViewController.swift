//
//  VideoViewController.swift
//  SimpleYoutube
//
//  Created by MCUCSIE on 11/5/18.
//  Copyright © 2018 MCUCSIE. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    @IBOutlet weak var playerView: YTPlayerView!
    var videoID: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let videoID = videoID {
            playerView.load(withVideoId: videoID)
        }
    }
}
