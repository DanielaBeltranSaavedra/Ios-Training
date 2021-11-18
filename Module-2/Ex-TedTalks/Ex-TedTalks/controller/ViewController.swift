//
//  ViewController.swift
//  Ex-TedTalks
//
//  Created by Daniela Paola Beltran Saavedra on 8/11/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTable: UITableView!
    @IBOutlet weak var TalksTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var talks: [Talk] = []
    var filteredData: [Talk] = []
    var filteredTags: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TalksTableView.separatorStyle = .none
        TalkManager().retrieve(){
            [weak self] result in
            switch result{
            case .success(let talks):
                self?.talks = talks
            case .failure(_):
                let alert = UIAlertController(title: "Error", message: "Hubo un error", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
        }
        filteredData = talks
        filteredTags = filteredData.flatMap({ $0.tags})
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard tableView.tag == 1 else{
            return filteredData.count
        }
        return filteredTags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard tableView.tag == 1 else{
            let cell = TalksTableView.dequeueReusableCell(withIdentifier: "TalkCell",for: indexPath) as!TalkCell
            let videoUrl = filteredData[indexPath.row].url
            cell.video.load(URLRequest(url: URL(string: videoUrl)!))
            cell.titleLabel.text = "Main Speaker: " + filteredData[indexPath.row].main_speaker
            cell.descriptionLabel.text = filteredData[indexPath.row].description
            return cell
        }
        let cell = searchTable.dequeueReusableCell(withIdentifier: "searchCell",for: indexPath)
        cell.textLabel?.text = filteredTags[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "talk_detail") as? TalkDetailViewController
        if tableView.tag == 1 {
            let selectTag = filteredTags[indexPath.row]
            filteredTags.append(selectTag)
            TalksTableView.reloadData()
        }else{
            vc?.talkTitle = filteredData[indexPath.row].title
            vc?.videourl = filteredData[indexPath.row].url
            vc?.views = filteredData[indexPath.row].views
            vc?.date = filteredData[indexPath.row].published_date
            vc?.speaker = filteredData[indexPath.row].main_speaker
            vc?.talkDescription = filteredData[indexPath.row].description
            vc?.tags = filteredData[indexPath.row].tags
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
        filteredData = []
        filteredTags = []
        
        if searchText == "" {
            filteredData = talks
            filteredTags = filteredData.flatMap({ $0.tags})
        }
        for talk in talks {
            for tag in talk.tags{
                if tag.uppercased().contains(searchText.uppercased()){
                    let n = filteredData.map ({ $0.title })
                        .filter({$0 == talk.title})
                        .count
                    if n == 0 {
                        filteredData.append(talk)
                    }
                    if !filteredTags.contains(tag){
                        filteredTags.append(tag)
                    }
                }
            }
        }
        self.searchTable.reloadData()
        self.TalksTableView.reloadData()
    }
}
