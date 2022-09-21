//
//  ViewController.swift
//  ProjectCoreData
//
//  Created by Samuel Noye on 08/09/2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var qtyTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Expenses", in: context)
        let newExpense = Expenses(entity: entity!, insertInto: context)
        var price1 = "\(priceTF.text)"
        let total: Double
        
        newExpense.deletedDate =  Date()
        newExpense.id = expenseList.count as NSNumber
        newExpense.name = nameTF.text
        
        newExpense.price = price1 as? Double
        newExpense.qty = qtyTF.text as? NSNumber
        
        total = Double(priceTF.text as! Double) * Double(qtyTF.text as! Double)
        newExpense.total = total
        print("newExpense data:",newExpense)
        do {
            try context.save()
            expenseList.append(newExpense)
            navigationController?.popViewController(animated: true)
            print("Saved")
        }catch{
            print("print save error")
        }
    }
    

}

