//
//  CellInfoViewController.swift
//  firstProject
//
//  Created by Saleh Naser on 22/12/2022.
//

import UIKit
import CoreData

class CellInfoViewController: UIViewController {

    
    @IBOutlet weak var imagePrder: UIImageView!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblZone: UILabel!
    @IBOutlet weak var lblSpace: UILabel!
    @IBOutlet weak var lblNoOfRoom: UILabel!
    @IBOutlet weak var lblNoOfFloor: UILabel!
    @IBOutlet weak var lblHigh: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    var idOrder : Int32 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest : NSFetchRequest<Orders> = Orders.fetchRequest()
        do{
            let results = try context.fetch(fetchRequest)
            for result in results {
                if(result.id == idOrder){
                    imagePrder.image = result.image as! UIImage
                    lblType.text = "الطراز :" + result.typeOfFloor!
                    lblCity.text = "المدينة :" + result.city!
                    lblZone.text = "المنطقة :" + result.city!
                    lblSpace.text = "المساحة :" + String(result.space)
                    lblNoOfRoom.text = "الغرف :" + String(result.noOfRom)
                    lblNoOfFloor.text = "الطوابق :" + String(result.noOfFloor)
                    lblHigh.text = "الارتفاع :" + String(result.hight)
                    lblprice.text = "السعر :" + String(result.price)
                    
                }
            }
        }catch{
            print("error")
        }
        
    }
    
    @IBAction func Company(_ sender: Any) {
        
    }
    
   

}
