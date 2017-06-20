//
//  ViewController.swift
//  legislatorsList
//
//  Created by vignesh on 6/20/17.
//  Copyright © 2017 vignesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var arry = [legislator]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hello")
        self.getDetails()
    }
    
    func getDetails() {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let apiCall = "https://congress.api.sunlightfoundation.com/legislators?apikey=xxxxxxxxxxxxxxxxxx&all_legislators=true&per_page=all"
        
        guard let url = URL(string: apiCall) else { return  }
        session.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error?.localizedDescription ?? "no error")
                return
            }
            
            else if let jsonData = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: AnyObject]
                    print(json)
                    
                    guard let results = json["results"] as? [NSDictionary] else {return}
                    
                    for result in results {
                        let details = legislator()
                        
                        print("RESULTS : \(result)")
                        
                        details.firstName = result["first_name"] as! String
                        details.lastName = result["last_name"] as! String
                        details.party = result["party"] as! String
                        details.title = result["title"] as! String
                        details.phonenum = result["phone"] as! String
                        
                        
                        
                        self.arry.append(details)
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }catch {
                    print(error)
                }
            }
            
        }.resume()
        
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arry.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! legislatorsCell
        
        let legislatorDetails = arry[indexPath.row]
        cell.firstName.text = legislatorDetails.firstName
        cell.lastName.text = legislatorDetails.lastName
        cell.partyName.text = legislatorDetails.party
        cell.titleName.text = legislatorDetails.title
        cell.phonenumberlabel.text = legislatorDetails.phonenum
        
        return cell
    }
    
    


}

