//
//  AddCompanyViewController.swift
//  firstProject
//
//  Created by Saleh Naser on 22/12/2022.
//

import UIKit
import CoreData
class AddCompanyViewController: UIViewController {

    @IBOutlet weak var txtId: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtRating: UITextField!
    @IBOutlet weak var txtFavort: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddCompany(_ sender: Any) {
       /*let user = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context) as! Company
        user.id = Int32(txtId.text!) ?? 0
        user.name = txtName.text
        user.city = txtCity.text
        user.rating = 0
        user.favort = 0
        
        do{
        context.insert(user)
           try context.save()
            
           
            print("Data insart")
        } catch {
            print("Not INsert")
        
    }*/
       let fetchRequest : NSFetchRequest<Company> = Company.fetchRequest()
        do{
            let results = try context.fetch(fetchRequest)
            for result in results {
                
               print(result.id)
                print(result.name)
                print(result.city)
            }
        
            print("Delete Don")
        }catch{
            print("error")
        }
   

}
}
