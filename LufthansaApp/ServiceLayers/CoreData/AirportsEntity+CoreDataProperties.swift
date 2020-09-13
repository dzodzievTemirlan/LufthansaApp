//
//  AirportsEntity+CoreDataProperties.swift
//  
//
//  Created by Temirlan Dzodziev on 18.08.2020.
//
//

import Foundation
import CoreData

@objc(AirportsEntity)
public class AirportsManagedObject: NSManagedObject {
}

extension AirportsManagedObject {
  @nonobjc class func fetchRequest() -> NSFetchRequest<AirportsManagedObject> {
    return NSFetchRequest<AirportsManagedObject>(entityName: "AirportsEntity")
  }
  @NSManaged var airports: AirportModel
}
