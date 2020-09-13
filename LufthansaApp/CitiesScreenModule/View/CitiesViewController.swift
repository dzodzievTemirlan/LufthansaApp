//
//  CitiesViewController.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var presenter: CitiesViewPresenterProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(CityCell.self, forCellReuseIdentifier: String(describing: CityCell.self))
    tableView.dataSource = self
    tableView.delegate = self
    presenter?.getCitiesFromLocal()
    tableView.refreshControl = refreshControl
  }
  
  let refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(pullToRequest), for: .valueChanged)
    return refreshControl
  }()
  
  @objc func pullToRequest(sender: UIRefreshControl) {
    presenter?.getCitiesFromNetwork()
    sender.endRefreshing()
    presenter?.localStorageIsEmpty = false
  }
}

extension CitiesViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter?.cities?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CityCell.self),
                                                   for: indexPath) as? CityCell
                                                   else { fatalError() }
    guard let cities = presenter?.cities else { return cell}
    cell.cityLabel.text = cities[indexPath.row].names.name.empty
    return cell
  }
}
