//
//  CoreDataService.swift
//  LufthansaApp
//
//  Created by Temirlan Dzodziev on 13.08.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
import CoreData

enum EntityNames: String {
  case countries = "CountriesEntity"
  case cities = "CitiesEntity"
  case airports = "AirportsEntity"
}
enum KeyType: String {
  case country
  case cities
  case airports
}
protocol CoreDataServiceProtocol {
  func saveDataFromNetwork<Elements>(key whichKey: KeyType,
                                     to entity: EntityNames,
                                     that model: [Elements] )
  
  func fetchDataFromCoreData<T: NSManagedObject>(key whichKey: KeyType,
                                                 to entity: EntityNames,
                                                 type: T.Type,
                                                 compelition: @escaping ([T]?, Error?) -> Void)
}

class CoreDataService: CoreDataServiceProtocol {
  var context: NSManagedObjectContext {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
    let someContext = appDelegate.persistentContainer.viewContext
    return someContext
  }
  
  func saveDataFromNetwork<Elements>(key whichKey: KeyType,
                                     to entityName: EntityNames,
                                     that model: [Elements]) {
    guard let userEntity = NSEntityDescription.entity(forEntityName: entityName.rawValue,
                                                      in: context) else { return }
    for country in model {
      let managedObject = NSManagedObject(entity: userEntity, insertInto: context)
      managedObject.setValue(country, forKey: whichKey.rawValue)
    }
    
    do {
      try context.save()
    } catch {
      print(error)
    }
  }
  
  func fetchDataFromCoreData<T: NSManagedObject>(key whichKey: KeyType,
                                                 to entity: EntityNames,
                                                 type: T.Type,
                                                 compelition: @escaping ([T]?, Error?) -> Void) {
    let fetchRequest = NSFetchRequest<T>(entityName: entity.rawValue)
    let sort = NSSortDescriptor(key: whichKey.rawValue, ascending: true)
    fetchRequest.sortDescriptors = [sort]
    
    do {
      let result = try context.fetch(fetchRequest)
      compelition(result as [T], nil)
    } catch let error as NSError {
      print(error.localizedDescription)
    }
  }
}
