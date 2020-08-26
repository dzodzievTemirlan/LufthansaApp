import Foundation
import CoreData

@objc(CountriesEntity)
public class CountryManagedObject: NSManagedObject {
}

extension CountryManagedObject {
  @nonobjc class func fetchRequest() -> NSFetchRequest<CountryManagedObject> {
    return NSFetchRequest<CountryManagedObject>(entityName: "CountriesEntity")
  }
  @NSManaged var country: Country
}
