//
//  AirportsViewController.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 11.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class AirportsViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  var presenter: AirportsViewPresenterProtocol?
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(AirportsCell.self, forCellReuseIdentifier: String(describing: AirportsCell.self))
    tableView.dataSource = self
    tableView.delegate = self
    presenter?.getAirportsFromLocal()
    tableView.refreshControl = refreshControl
    navBarRightBarButton()
  }
  
  fileprivate func navBarRightBarButton() {
    let mapButton = UIButton(type: .system)
    guard let image = UIImage(systemName: "mappin.and.ellipse") else { return }
    mapButton.setImage(image.withRenderingMode(.alwaysOriginal).withTintColor(#colorLiteral(red: 0.9176470588, green: 0.5647058824, blue: 0.4784313725, alpha: 1)), for: .normal)
    mapButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: mapButton)
    mapButton.addTarget(self, action: #selector(showMap), for: .touchUpInside)
  }
  
  @objc func showMap() {
    presenter?.showMap()
  }
  
  let refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(pullToRequest), for: .valueChanged)
    return refreshControl
  }()
  
  @objc func pullToRequest(sender: UIRefreshControl) {
    presenter?.getAirportsFromNetwork()
    sender.endRefreshing()
    presenter?.localStorageIsEmpty = false
  }
}

extension AirportsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let airports = presenter?.airports else { return 0}
    return airports.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard
      let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AirportsCell.self),
                                               for: indexPath) as? AirportsCell
                                               else { fatalError() }
    guard let airports = presenter?.airports else { return cell }
    cell.airportLabel.text = airports[indexPath.row].names.name.empty
    cell.cityCodeLabel.text = airports[indexPath.row].cityCode
    cell.countryCodeLabel.text = airports[indexPath.row].countryCode
    return cell
  }
}
