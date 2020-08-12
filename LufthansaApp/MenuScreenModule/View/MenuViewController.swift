//
//  ViewController.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 09.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var presenter: MenuViewPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: String(describing: MenuCell.self))
    }

}
