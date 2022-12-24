//
//  CompanyViewController.swift
//  firstProject
//
//  Created by Saleh Naser on 23/12/2022.
//

import UIKit
import CoreData
class CompanyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var compny = [Companys]()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate=self
        tableView.dataSource=self
        let fetchRequest : NSFetchRequest<Company> = Company.fetchRequest()
        do{
            let results = try context.fetch(fetchRequest)
            for result in results {
                compny.append(Companys.init(photo: UIImage(named: "user1")! , id: result.id, city: result.city ??  "nil", name: result.name ?? "nil", rating: result.rating))
            }
        }catch{
            print("error")
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return compny.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell", for:indexPath) as! CompanyTableViewCell
        let data = compny[indexPath.row]
        cell.setUpCell(photo: data.photo, id: data.id, city: data.city, name: data.name, rating: data.rating)
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}
struct Companys{
    let photo: UIImage
    let id: Int32
    let city: String
    let name: String
    let rating: Int32
}
