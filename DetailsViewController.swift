//
//  DetailsViewController.swift
//  userRegistrationAndLogin
//
//  Created by MOSHIOUR on 10/1/18.
//  Copyright © 2018 moshiour. All rights reserved.
//

import UIKit


struct jsonStructure : Decodable{
    let name : String
    let capital : String
    let alpha3Code : String
    let region : String
    let subregion : String
    let population : Int
}

class DetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var arrData = [jsonStructure]()

    @IBOutlet weak var userName: UINavigationItem!
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        
        
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        UserDefaults.standard.synchronize()
        
        //switching to login screen
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(loginViewController, animated: true)
        self.dismiss(animated: false, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getData()
        //hiding back button
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        //getting user data from defaults
        let defaultValues = UserDefaults.standard
        
        
        if let name = defaultValues.string(forKey: "username"){
            //setting the name to label
            userName.title = name
        }else{
            //send back to login view controller
        }
        
        
        
        
    }

    func getData(){
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do{
                if error == nil{
                    let decoder = JSONDecoder()
                    self.arrData = try decoder.decode([jsonStructure].self, from: data!)
                    
                    for arr in self.arrData{
                        print(arr.name, " : ", arr.capital, " : ", arr.alpha3Code)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }
                }
            }
            catch{
                print("Error in get json data")
            }
            
            
            }.resume()
        
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath) as! TableViewCell
        
        //cell.capitalLabel.text = "Capital : \(arrData[indexPath.row].capital)"
        //cell.countryLabel.text = "\(arrData[indexPath.row].name)"
        cell.countryName.text = "\(arrData[indexPath.row].name)"
        
        cell.capitalName.text = "Capital : \(arrData[indexPath.row].capital)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsView : ApiDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ApiDetailsViewController") as! ApiDetailsViewController
        
        detailsView.strName = "\(arrData[indexPath.row].name)"
        detailsView.strcapital = "Capital : \(arrData[indexPath.row].capital)"
        detailsView.stralpha3 = "alpha3 : \(arrData[indexPath.row].alpha3Code)"
        detailsView.strregion = "Region : \(arrData[indexPath.row].region)"
        detailsView.strsubregion = "Subregion: \(arrData[indexPath.row].subregion)"
        detailsView.strpopulation = "Population: \(arrData[indexPath.row].population)"
        
        
        self.navigationController?.pushViewController(detailsView, animated: true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
