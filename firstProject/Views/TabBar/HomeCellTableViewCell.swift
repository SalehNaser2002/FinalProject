//
//  HomeCellTableViewCell.swift
//  firstProject
//
//  Created by Saleh Naser on 20/12/2022.
//

import UIKit
import CoreData
class HomeCellTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var imageOrder: UIImageView!
   
    func setUpCell(photo: UIImage, id: Int32 ,address: String, type: String, price: Int){
        lblPrice.text = String(price)
        lblDate.text = String(id)
        imageOrder.image = photo
        lblType.text = type
        lblAddress.text = address
        
    }
    

}
