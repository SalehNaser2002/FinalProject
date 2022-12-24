//
//  OrdersViewController.swift
//  firstProject
//
//  Created by Saleh Naser on 19/12/2022.
//

import UIKit
import CoreData

class OrdersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    
    var controller : NSFetchedResultsController<Orders>!

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        loadIetms()
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections{
            let sectionInfo=sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCellTableViewCell
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
   
    func loadIetms(){
        let fetchRequest:NSFetchRequest<Orders> = Orders.fetchRequest()
        let itemDate=NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors=[itemDate]
        controller=NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate=self
        do{
            try controller.performFetch()
        }catch{
            print("error")
        }
    }
    func configureCell(cell:HomeCellTableViewCell,indexPath:IndexPath){
        let Myorder = controller.object(at: indexPath)
        cell.setMyCell(orders: Myorder)
    }
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    switch(type) {
    case.insert:
        if let indexPath = newIndexPath {
            tableView.insertRows(at: [indexPath], with: .fade)
        }
        break
    case.delete:
        if let indexPath = indexPath {
        tableView.deleteRows(at: [indexPath], with: .fade)
        }
        break
    case .move:
        if let indexPath = indexPath {
        tableView.deleteRows(at: [indexPath], with: .fade)
        }
        if let indexPath = indexPath {
        tableView.insertRows(at: [indexPath], with: .fade)
        }
        break
    case .update:
        if let indexPath = newIndexPath {
        let cell = tableView.cellForRow(at: indexPath
        ) as! HomeCellTableViewCell
        configureCell(cell: cell, indexPath: indexPath)
        }
                
        }
    }
}
