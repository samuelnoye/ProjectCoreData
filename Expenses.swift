//
//  Expense.swift
//  ProjectCoreData
//
//  Created by Samuel Noye on 10/09/2022.
//

import CoreData


@objc(Expense)
class Expenses: NSManagedObject{
    @NSManaged var id: NSNumber!
  //  @NSManaged var name: String!
    @NSManaged var price: Double
    @NSManaged var qty: NSNumber!
    @NSManaged var total: Double
    @NSManaged var deletedDate: Date?
}
