//
//  EntryViewController.swift
//  DemoApp
//
//  Created by shweta parjane on 25/10/22.
//

import UIKit

class EntryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showEmployeeDetails(_ sender: Any) {
        
        let peopleVC = self.storyboard?.instantiateViewController(withIdentifier: "PeopleListController") as! PeopleListController
        self.navigationController?.pushViewController(peopleVC, animated: true)
        
    }
    
    @IBAction func showRoomDetails(_ sender: Any) {
        
        let roomsVC = self.storyboard?.instantiateViewController(withIdentifier: "RoomsListViewController") as! RoomsListViewController
        self.navigationController?.pushViewController(roomsVC, animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
