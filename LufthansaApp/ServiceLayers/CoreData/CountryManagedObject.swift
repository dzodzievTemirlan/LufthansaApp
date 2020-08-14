import Foundation
import CoreData

@objc(CountriesEntity)
public class CountryManagedObject: NSManagedObject {

}

extension CountryManagedObject {
  @NSManaged public var country: Country
}
