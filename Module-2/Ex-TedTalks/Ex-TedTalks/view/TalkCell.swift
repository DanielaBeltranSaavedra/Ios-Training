//
//  TalkCell.swift
//  Ex-TedTalks
//
//  Created by Daniela Paola Beltran Saavedra on 9/11/21.
//

import UIKit
import WebKit

class TalkCell: UITableViewCell {
    
    @IBOutlet weak var talksContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var video: WKWebView!
    @IBOutlet weak var descriptionLabel: UILabel!
    //@IBOutlet weak var imageVideo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
