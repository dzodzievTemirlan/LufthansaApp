//
//  CountriesViewController.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 10.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: CountriesViewPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CountryCell.self, forCellReuseIdentifier: String(describing: CountryCell.self))
        tableView.dataSource = self
        tableView.delegate = self
        presenter?.getCountriesFromLocal()
        tableView.refreshControl = refreshControl
        //        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRequest), for: .valueChanged)
        return refreshControl
    }()
    
    @objc func pullToRequest(sender: UIRefreshControl) {
        presenter?.getCountriesFromNetwork()
        sender.endRefreshing()
        presenter?.localStorageIsEmpty = false
    }
}

extension CountriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.coutries?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CountryCell.self),
                                                       for: indexPath ) as? CountryCell
                                                       else { fatalError() }
        guard let countries = presenter?.coutries else { return cell }
        cell.countryLabel.text = countries[indexPath.row].names.name.empty
        return cell
    }
}
