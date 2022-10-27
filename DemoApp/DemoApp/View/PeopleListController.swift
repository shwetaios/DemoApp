//
//  PeopleListController.swift
//  DemoApp
//
//  Created by shweta parjane on 25/10/22.
//

import UIKit


class PeopleListController: BaseViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    private var viewModel = PeopleViewModel()
    var searching = false
    var searchStr = ""
    

    @IBOutlet weak var empTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        showLoader()
        self.viewModel.peopleLoaded = { [weak self] (response, success) in
            self?.hideLoader()
            if success {
                self?.empTableView.reloadData()
            } else {
                self?.showNotification(title: Constant.alertTitle, message: Constant.alertMessage)
            }
        }
    }
    
    private func setupUI() {
        self.empTableView.registerCell(type: PeopleTableViewCell.self)
        self.searchBar.delegate = self

        // Change the Tint Color
        // Show/Hide Cancel Button
        self.searchBar.showsCancelButton = true
        // Change TextField Colors
        let searchTextField = self.searchBar.searchTextField
        searchTextField.textColor = UIColor.black
        searchTextField.clearButtonMode = .never
        // Change Glass Icon Color
        let glassIconView = searchTextField.leftView as! UIImageView
        glassIconView.image = glassIconView.image?.withRenderingMode(.alwaysTemplate)
        
        self.searchBar.keyboardAppearance = .dark
    }
    
}

extension PeopleListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedData: PeopleResponse?
        
        if searching {
            selectedData = self.viewModel.getFilteredPeople(index: indexPath.row)
        } else {
            selectedData = self.viewModel.getPeople(index: indexPath.row)
        }
        // Remove highlight from the selected cell
        empTableView.deselectRow(at: indexPath, animated: true)
        // Close keyboard when you select cell
        self.searchBar.searchTextField.endEditing(true)
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailVC.selectedData = selectedData
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
   
      
}

extension PeopleListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return  self.viewModel.filterednumberOfRows(searchText: searchStr)
        }
        return self.viewModel.numberOrRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = empTableView.dequeueCell(withType: PeopleTableViewCell.self, for: indexPath) as? PeopleTableViewCell, let peopleData = searching ? self.viewModel.getFilteredPeople(index: indexPath.row) : self.viewModel.getPeople(index: indexPath.row)  else {
            return UITableViewCell()
        }
        cell.setPeopleData(peopleData: peopleData)
        return cell
    }
   
}

extension PeopleListController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchStr = searchText
        searching = true
       if searchStr.count == 0 {
            searching = false
        }
        empTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if searchStr.count != 0 {
            searching = false
            searchBar.text = ""
            empTableView.reloadData()
        }
    }
}




