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
    }

}
extension AirportsViewController: AirportsViewProtocol {
    func success() {
        tableView.reloadData()
    }
    func failure(error: Error) {
        print(error)
    }
}
