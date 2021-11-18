//
//  TalkDetailViewController.swift
//  Ex-TedTalks
//
//  Created by Daniela Paola Beltran Saavedra on 17/11/21.
//

import UIKit
import WebKit

class TalkDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var talkVideo: WKWebView!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mainSpeakerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var TagsLabel: UILabel!
    var talkTitle = ""
    var videourl = ""
    var views = 0
    var date = 0
    var speaker = ""
    var talkDescription = ""
    var tags: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = talkTitle
        let url = videourl
        talkVideo.load(URLRequest(url: URL(string: url)!))
        viewsLabel.text = "#of views:  " + String (views)
        let myDate = getDateString(date: date)
        dateLabel.text = "Published Date: " + String (myDate)
        mainSpeakerLabel.text = speaker + ": " + talkTitle
        descriptionLabel.text = talkDescription + talkDescription
        print(tags)
        let tagsString =  getTagsString(myTags: tags)
        TagsLabel.text  = "Tags: " + tagsString
        
    }
    func getDateString(date: Int) -> String {
        let newTime = Date(timeIntervalSince1970: TimeInterval(date))
        print(newTime)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: newTime)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: newTime)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: newTime)
        return year + "-" + month + "-" + day
    }
    func getTagsString(myTags: [String]) -> String{
        print(myTags)
        var tagString = ""
        guard myTags.count != 0 else{
            return tagString
        }
        for index in (0..<myTags.count){
            print(myTags)
            tagString = tagString + myTags[index]
            if index != (myTags.count-1){
                tagString = tagString + ", "
            }
        }
        return tagString
        
    }
    
}
