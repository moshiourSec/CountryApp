//
//  ApiDetailsViewController.swift
//  userRegistrationAndLogin
//
//  Created by MOSHIOUR on 10/1/18.
//  Copyright © 2018 moshiour. All rights reserved.
//

import UIKit

class ApiDetailsViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var capitalLbl: UILabel!
    @IBOutlet weak var regionLbl: UILabel!
    @IBOutlet weak var subRegionLbl: UILabel!
    @IBOutlet weak var populationLbl: UILabel!
    
    @IBOutlet weak var alpha3codeLbl: UILabel!
    
    var strName : String = ""
    var strcapital : String = ""
    var stralpha3 : String = ""
    var strregion : String = ""
    var strsubregion : String = ""
    var strpopulation : String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        nameLbl.text = strName
        capitalLbl.text = strcapital
        alpha3codeLbl.text = stralpha3
        regionLbl.text = strregion
        subRegionLbl.text = strsubregion
        populationLbl.text = strpopulation
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        
        

    }
    


}
