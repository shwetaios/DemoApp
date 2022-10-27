//
//  PeopleViewModel.swift
//  DemoApp
//
//  Created by shweta parjane on 25/10/22.
//

import Foundation

class RoomsViewModel: BaseViewModel {
    var rommsLoaded: (([RoomResponse]?, Bool) -> Void)?
    var roomsList: [RoomResponse]?
    var filteredList: [RoomResponse]?
    
    override func callService() {
        ApiManager.shared.retrieveRoomsData { [weak self] response in
            self?.roomsList = response
            self?.handleResponse(response: response, success: true)
        } fail: { [weak self] _ in
            self?.handleResponse(response: nil, success: false)
        }
    }

    private func handleResponse(response: [RoomResponse]?, success: Bool) {
        if let roomsDataLoaded = self.rommsLoaded {
            roomsDataLoaded(response, success)
        }
    }

    func numberOrRows() -> Int {
        return self.roomsList?.count ?? 0
    }
    
    func filterednumberOfRows(searchText: String) -> Int {
        
        filteredList = roomsList?.filter{ ($0.id?.contains(searchText) ?? false) }
        return filteredList?.count ?? 0
    }

    func getFilteredRooms(index: Int) -> RoomResponse? {
        return self.filteredList?[index]
    }
    
    func getRooms(index: Int) -> RoomResponse? {
        return self.roomsList?[index]
    }
    
}
