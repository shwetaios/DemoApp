//
//  DetailsViewController.swift
//  DemoApp
//
//  Created by shweta parjane on 25/10/22.
//

import UIKit



class DetailsViewController: UIViewController {
    
    var selectedData: PeopleResponse?

    
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var idLabel: UILabel!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var FavouriteColorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpdetails()
        // Do any additional setup after loading the view.
    }
    
    func setUpdetails(){
        
        guard let url = URL(string: selectedData?.avatar ?? "") else {
            return
        }
        
        DispatchQueue.main.async {
            [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.profileimage.image = loadedImage
                }
            } else {
                let noImage: UIImage = UIImage(named: "NoImage")!
                self?.profileimage.image = noImage
            }
        }
        
        if let firstName = selectedData?.firstName, let lastname = selectedData?.lastName {
            nameLabel.text = PeopleScrreLabelTitle.email + firstName + Constant.space + lastname
        }
        
        if let id = selectedData?.id {
            idLabel.text = PeopleScrreLabelTitle.id + id
        }
        
        if let email = selectedData?.email {
            emailLabel.text = PeopleScrreLabelTitle.email + email
        }
        
        if let jobtitle = selectedData?.jobtitle {
            jobTitleLabel.text = PeopleScrreLabelTitle.jobTitle + jobtitle
        }
        
        if let favouriteColor = selectedData?.favouriteColor {
            FavouriteColorLabel.text = PeopleScrreLabelTitle.favouriteColor + favouriteColor
        }

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
