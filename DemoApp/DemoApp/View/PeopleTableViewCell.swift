//
//  PeopleTableViewCell.swift
//  DemoApp
//
//  Created by shweta parjane on 25/10/22.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        applyShadow(cornerRadius: 8)
    }

    func setPeopleData(peopleData: PeopleResponse) {

        guard let url = URL(string: peopleData.avatar ?? "") else {
            return
        }
        
        DispatchQueue.main.async {
            [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.profileImage.image = loadedImage
                }
            } else {
                let noImage: UIImage = UIImage(named: "NoImage")!
                self?.profileImage.image = noImage
            }
        }

        nameLabel.text = peopleData.firstName
        designationLabel.text = peopleData.jobtitle
    }
    
}


