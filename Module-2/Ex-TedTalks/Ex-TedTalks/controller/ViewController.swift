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
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard tableView.tag == 1 else{
            return filteredData.count
        }
        return filteredTags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard tableView.tag == 1 else{
            let cell = TalksTableView.dequeueReusableCell(withIdentifier: "TalkCell",for: indexPath) as!TalkCell
            let videoUrl = "https://embed.ted.com/talks/majora_carter_s_tale_of_urban_renewal"
            cell.video.load(URLRequest(url: URL(string: videoUrl)!))
            cell.titleLabel.text = "Ken Robinson: Do schools kill creativity?"
            cell.descriptionLabel.text = "With the same humor and humanity he exuded in 'An Inconvenient Truth,' Al Gore spells out 15 ways that individuals can address climate change immediately, from buying a hybrid to inventing a new, hotter brand name for global warming."
           // cell.textLabel? = filteredData[indexPath.row].
            return cell
        }
        let cell = searchTable.dequeueReusableCell(withIdentifier: "searchCell",for: indexPath)
        cell.textLabel?.text = filteredTags[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       if tableView.tag == 1 {
           
            TalksTableView.reloadData()
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
            print(filteredTags)
        }
        for word in talks {
            for tag in word.tags{
                if tag.uppercased().contains(searchText.uppercased()){
                    filteredData.append(word)
                    if !filteredTags.contains(tag){
                        filteredTags.append(tag)
                    }
                    
                }
            }
            
        }
        self.searchTable.reloadData()
    }
}
