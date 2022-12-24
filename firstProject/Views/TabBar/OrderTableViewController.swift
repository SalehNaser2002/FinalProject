//
//  OrderTableViewController.swift
//  firstProject
//
//  Created by Saleh Naser on 21/12/2022.
//

import UIKit
import CoreData
class OrderTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    var order = [Order]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        
        let fetchRequest : NSFetchRequest<Orders> = Orders.fetchRequest()
        do{
            let results = try context.fetch(fetchRequest)
            for result in results {
                order.append(Order.init(photo: result.image as! UIImage, id: result.id, address:result.city ??  "nil", type: result.typeOfFloor ?? "nil", price: Int(result.price)))
            }
        }catch{
            print("error")
        }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for:indexPath) as! HomeCellTableViewCell
        let data = order[indexPath.row]
        cell.setUpCell(photo: data.photo, id: data.id, address: data.address, type: data.type, price: data.price)
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //InfoCell
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "InfoCell") as! CellInfoViewController
        vc.idOrder = order[indexPath.row].id
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
struct Order{
let photo: UIImage
let id: Int32
let address: String
let type: String
let price: Int
}
