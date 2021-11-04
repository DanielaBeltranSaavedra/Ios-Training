//
//  ChatMessageCekkTableViewCell.swift
//  
//
//  Created by Daniela Paola Beltran Saavedra on 2/11/21.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var messageLabel : UILabel!
    @IBOutlet weak var dateLabel:  UILabel!
    @IBOutlet weak var bubbleBackgroundView:  UIView!
    @IBOutlet weak var content: UIView!
    
    //@IBOutlet weak var content: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // content.translatesAutoresizingMaskIntoConstraints = false
        //content.layer.cornerRadius = 10
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        bubbleBackgroundView.layer.cornerRadius = 10
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.numberOfLines = 0
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.numberOfLines = 0
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            content.topAnchor.constraint(equalTo: userNameLabel.topAnchor,constant: -30),
            content.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -30),
            content.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor,constant: 30),
            content.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor,constant: 30)
            
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /* override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?){
     super.init(style: style, reuseIdentifier: reuseIdentifier)
     bubbleBackgroundView.backgroundColor = .systemGray6
     bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
     bubbleBackgroundView.layer.cornerRadius = 10
     userNameLabel.textColor = .systemYellow
     addSubview(bubbleBackgroundView)
     addSubview(userNameLabel)
     addSubview(messageLabel)
     addSubview(dateLabel)
     messageLabel.numberOfLines = 0
     messageLabel.translatesAutoresizingMaskIntoConstraints = false
     userNameLabel.numberOfLines = 0
     userNameLabel.translatesAutoresizingMaskIntoConstraints = false
     dateLabel.numberOfLines = 0
     dateLabel.translatesAutoresizingMaskIntoConstraints = false
     // messageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
     */
    /*   let constraints = [userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
     userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 28),
     
     messageLabel.topAnchor.constraint(equalTo: userNameLabel.topAnchor, constant: 42),
     messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 32),
     
     
     messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -32),
     messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
     
     bubbleBackgroundView.topAnchor.constraint(equalTo: userNameLabel.topAnchor,constant: -30),
     
     bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, cons
     tant: -30),
     bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor,constant: 30),
     
     bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor,constant: 30),
     
     dateLabel.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor,constant: 20),
     dateLabel.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor,constant: 20)
     
     
     ]
     NSLayoutConstraint.activate(constraints)*/
    
}

/*  required init?(coder: NSCoder) {
 fatalError("init(coder:) has not been implemented")
 }*/

