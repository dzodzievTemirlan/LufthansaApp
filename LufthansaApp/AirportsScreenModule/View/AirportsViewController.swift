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
}
