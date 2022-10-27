//
//  ApiManager.swift
//  DemoApp
//
//  Created by shweta parjane on 25/10/22.
//

import Foundation

class ApiManager {
    public static let shared = ApiManager()

    func retrievePeopleData(success: @escaping (([PeopleResponse]) -> Void), fail: @escaping ((HTTPError) -> Void)) {
        ServiceManager.shared.callService(urlString: Constants.PEOPLE_URL, method: .get) { (response: [PeopleResponse]) in
            success(response)
        } fail: { error in
            fail(error)
        }
    }
    
    func retrieveRoomsData(success: @escaping (([RoomResponse]) -> Void), fail: @escaping ((HTTPError) -> Void)) {
        ServiceManager.shared.callService(urlString: Constants.ROOMS_URL, method: .get) { (response: [RoomResponse]) in
            success(response)
        } fail: { error in
            fail(error)
        }
    }
}
