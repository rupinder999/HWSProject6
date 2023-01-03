//
//  ViewController.swift
//  HWSProject5
//
//  Created by Rupinder on 01/03/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"

            if let url = URL(string: urlString) {
                let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
                    // we're OK to parse!
                    guard let responseData = data else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.parse(data: responseData)
                    }
                }
                dataTask.resume()
            }
    }
    
    func parse(data: Data) {
        if let result = try? JSONDecoder().decode(Petitions.self, from: data) {
            self.petitions = result.results
            tableView.reloadData()
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = petitions[indexPath.row].title
        cell.detailTextLabel?.text = petitions[indexPath.row].body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

