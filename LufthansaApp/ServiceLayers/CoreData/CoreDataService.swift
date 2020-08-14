//
//  CoreDataService.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 13.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
import CoreData

enum EntityNames: String{
    case countries = "CountriesEntity"
    case cities = "Cities"
    case airports = "Airports"
}

protocol CoreDataServiceProtocol {
    func saveDataFromNetwork<Elements>(to entity: EntityNames, that model: [Elements] )
    func fetchDataFromCoreData<Elements>(to entity: EntityNames, compilition: @escaping ([Elements]?, Error) -> Void)
    func updateDataInCoreData<Elements>(to entity: EntityNames, that model: [Elements])
}

class CoreDataService: CoreDataServiceProtocol {
    var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        let someContext = appDelegate.persistentContainer.viewContext
        return someContext
    }
    
    func saveDataFromNetwork<Elements>(to entityName: EntityNames, that model: [Elements]) {
        guard let userEntity = NSEntityDescription.entity(forEntityName: entityName.rawValue, in: context) else { return }
        let someData = NSManagedObject(entity: userEntity, insertInto: context)
        someData.setValue(model, forKey: "\(entityName.rawValue)Data")
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    func fetchDataFromCoreData<Elements>(to entity: EntityNames, compilition: @escaping ([Elements]?, Error) -> Void) {
    }
    func updateDataInCoreData<Elements>(to entity: EntityNames, that model: [Elements]) {
    }
}
