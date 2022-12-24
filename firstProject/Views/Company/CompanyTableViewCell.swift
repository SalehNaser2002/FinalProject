//
//  CompanyTableViewCell.swift
//  firstProject
//
//  Created by Saleh Naser on 23/12/2022.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {
    @IBOutlet weak var imageCompany: UIImageView!
    @IBOutlet weak var viewCompany: UIView!
    
    @IBOutlet weak var RatingCompany: UILabel!
    @IBOutlet weak var cityCmpany: UILabel!
    @IBOutlet weak var nameCompany: UILabel!
    
    func setUpCell(photo: UIImage, id: Int32 ,city: String, name: String, rating: Int32){
        imageCompany.image = photo
        RatingCompany.text = String(rating)
        cityCmpany.text = city
        nameCompany.text = name
        var id : Int32 = id
    }
}
