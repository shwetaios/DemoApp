//
//  PeopleTableViewCell.swift
//  DemoApp
//
//  Created by shweta parjane on 25/10/22.
//

import UIKit

class RoomsTableViewCell: UITableViewCell {

    @IBOutlet weak var roomNumberLabel: UILabel!
    @IBOutlet weak var roomCapacityLabel: UILabel!
    @IBOutlet weak var OccupacyStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        applyShadow(cornerRadius: 8)
    }

    func setRoomsData(roomsData: RoomResponse) {
        
        if let roomId = roomsData.id {
            roomNumberLabel.text = RoomsScrreLabelTitle.roomNumber + roomId
            if let maxOccupacy = roomsData.maxOccupancy {
                roomCapacityLabel.text = RoomsScrreLabelTitle.roomOccupacy + "\(maxOccupacy)"
            }
            if roomsData.isOccupied {
                OccupacyStatusLabel.text = RoomsScrreLabelTitle.roomAvalability + RoomsScrreLabelTitle.notAvailable
            } else {
                OccupacyStatusLabel.text = RoomsScrreLabelTitle.roomAvalability + RoomsScrreLabelTitle.available
            }
        }
    }
    
}


