//
//  ViewController.swift
//  SimpleYoutube
//
//  Created by MCUCSIE on 10/25/18.
//  Copyright © 2018 MCUCSIE. All rights reserved.
//

import UIKit
import GoogleAPIClientForREST

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var waitingView: UIView!
    private let service = GTLRYouTubeService()
    var videos: [GTLRYouTube_Video]?
    var selectedVideoID: String!
    var videoNum = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        waitingView.frame = CGRect(x: 0, y: 64, width: waitingView.frame.size.width, height: waitingView.frame.size.height)
        view.addSubview(waitingView)
        service.apiKey = "AIzaSyAeLT4sdQoPlNcI5DswNp2-9FcYUm2lluc"
        fetchPopularVideos()
    }

    // List up to 10 files in Drive
    func fetchPopularVideos() {
        let query = GTLRYouTubeQuery_VideosList.query(withPart: "snippet")
        query.chart = "mostPopular"
        query.regionCode = "TW"
        query.maxResults = 50
        service.executeQuery(query) { [unowned self] (ticket: GTLRServiceTicket?, response: Any?, error: Error?) in
            if error != nil {
                print("Error: \(error!)")
            }
            else if let response = response as? GTLRYouTube_VideoListResponse {
                self.videoNum = (response.items?.count)!
                self.waitingView.removeFromSuperview()
                self.videos = response.items
                (self.view.subviews.first as! UITableView).reloadData()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoNum
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VideoTableViewCell
        if let videos = videos {
            if let title = videos[indexPath.row].snippet?.title {
                cell.title.text = "  " + title
            }
            let url = URL(string: videos[indexPath.row].snippet!.thumbnails!.high!.url!)
            if let data = try? Data(contentsOf: url!) {
                cell.thumbnail.image = UIImage(data: data)
            }
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let videos = videos {
            selectedVideoID = videos[indexPath.row].identifier!
        }
        performSegue(withIdentifier: "showVideo", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let videoController = segue.destination as! VideoViewController
        videoController.videoID = selectedVideoID
    }
}
