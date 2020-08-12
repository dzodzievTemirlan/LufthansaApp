//
//  Router.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 09.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? {get set}
    var screenBuilder: Builder? {get set}
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showCountriesViewController()
    func showCititesViewController()
    func showAirportsViewController()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var screenBuilder: Builder?
    init(navigationController: UINavigationController, screenBuilder: Builder) {
        self.navigationController = navigationController
        self.screenBuilder = screenBuilder
    }
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainVC = screenBuilder?.createInitialViewController(router: self) else { return }
            navigationController.viewControllers = [mainVC]
        }
    }
    func showCountriesViewController() {
        if let navigationController = navigationController {
            guard let secondVC = screenBuilder?.createCountriesViewController()  else { return }
            navigationController.pushViewController(secondVC, animated: true)
        }
    }
    func showCititesViewController() {
        if let navigationController = navigationController {
            guard let thirdVC = screenBuilder?.createCitiesViewController() else { return }
            navigationController.pushViewController(thirdVC, animated: true)
        }
    }
    func showAirportsViewController() {
        if let navigationController = navigationController {
            guard let fourthVC = screenBuilder?.createAirportsViewController() else { return }
            navigationController.pushViewController(fourthVC, animated: true)
        }
    }
}
