//
//  ViewController.swift
//  Ex-3-simple-chat
//
//  Created by Daniela Paola Beltran Saavedra on 27/10/21.
//

import UIKit
import MessageKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messagesTableView: UITableView!
    let cellId = "chatMessageCell"
    
    var messages: [Message] = []{
        didSet{
            self.messagesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        // messagesTableView.dequeueReusableCell(withIdentifier: "chatMessage")
        messagesTableView.separatorStyle = .none
        MessageManager().retrieve(){
            [weak self] result in
            switch result{
            case .success(let messages):
                self?.messages = messages
            case .failure(_):
                let alert = UIAlertController(title: "Error", message: "Hubo un error", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension ViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messagesTableView.dequeueReusableCell(withIdentifier: "chatMessage",for: indexPath) as! ChatMessageCell
        //  print(messages[indexPath.row].username)
        if (messages[indexPath.row].username  == "Me" ){
            cell.content.leadingAnchor.constraint(equalTo: cell.leadingAnchor,constant: 32).isActive = true
            cell.content.trailingAnchor.constraint(equalTo: cell.trailingAnchor,constant: -32).isActive = false
            cell.bubbleBackgroundView.leadingAnchor.constraint(equalTo: cell.leadingAnchor,constant: 32).isActive = true
            cell.bubbleBackgroundView.trailingAnchor.constraint(equalTo: cell.trailingAnchor,constant: -32).isActive = false
            cell.userNameLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor,constant: 32).isActive = true
            cell.userNameLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor,constant: -32).isActive = false
            cell.messageLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor,constant: 32).isActive = true
            cell.messageLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor,constant: -32).isActive = false
            //cell.userNameLabel.textAlignment = .right
            cell.bubbleBackgroundView.backgroundColor = UIColor(hue: 0.2778, saturation: 0.16, brightness: 0.97, alpha: 1.0)
            
            
        }else{
            cell.bubbleBackgroundView.backgroundColor = UIColor(hue: 0.1444, saturation: 0.04, brightness: 1, alpha: 1.0)
            cell.userNameLabel.text = messages[indexPath.row].username
        }
        cell.messageLabel.text = messages[indexPath.row].message
        cell.dateLabel.text = messages[indexPath.row].timeMessage
        
        return cell
    }
    
}
