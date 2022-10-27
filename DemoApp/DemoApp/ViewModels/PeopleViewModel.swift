//
//  PeopleViewModel.swift
//  DemoApp
//
//  Created by shweta parjane on 25/10/22.
//

import Foundation

class PeopleViewModel: BaseViewModel {
    var peopleLoaded: (([PeopleResponse]?, Bool) -> Void)?
    var peopleList: [PeopleResponse]?
    var filteredList: [PeopleResponse]?
    
    override func callService() {
        ApiManager.shared.retrievePeopleData { [weak self] response in
            self?.peopleList = response
            self?.handleResponse(response: response, success: true)
        } fail: { [weak self] _ in
            self?.handleResponse(response: nil, success: false)
        }
    }

    private func handleResponse(response: [PeopleResponse]?, success: Bool) {
        if let peopleDataLoaded = self.peopleLoaded {
            peopleDataLoaded(response, success)
        }
    }

    func numberOrRows() -> Int {
        return self.peopleList?.count ?? 0
    }
    
    func filterednumberOfRows(searchText: String) -> Int {
        
        filteredList = peopleList?.filter{ ($0.firstName?.contains(searchText) ?? false) }
        return filteredList?.count ?? 0
    }

    func getFilteredPeople(index: Int) -> PeopleResponse? {
        return self.filteredList?[index]
    }
    
    func getPeople(index: Int) -> PeopleResponse? {
        return self.peopleList?[index]
    }
    
}
