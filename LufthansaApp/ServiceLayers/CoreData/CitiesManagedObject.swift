import Foundation
import CoreData

@objc(CitiesEntity)
public class CitiesManagedObject: NSManagedObject {
}

extension CitiesManagedObject {
    @nonobjc class func fetchRequest() -> NSFetchRequest<CitiesManagedObject> {
        return NSFetchRequest<CitiesManagedObject>(entityName: "CitiesEntity")
    }
    @NSManaged var cities: CityModel
}
