//
//  NewOrderViewController.swift
//  firstProject
//
//  Created by Saleh Naser on 20/12/2022.
//

import UIKit
import CoreData

class NewOrderViewController: UIViewController{
    @IBOutlet weak var ImageSelect: UIImageView!
    @IBOutlet weak var TypeOfFloor: UIButton!
    @IBOutlet weak var Zone: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var company: UIButton!
    @IBOutlet weak var space: UITextField!
    @IBOutlet weak var noOfRoom: UITextField!
    @IBOutlet weak var noOfFloor: UITextField!
    @IBOutlet weak var hight: UITextField!
    @IBOutlet weak var price: UITextField!
    var TypeFlor = ""
    var Company = ""
    //var imagePicker:UIImagePickerController = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopButtonTypeOfFloor()
        setPopButtonTypeOfCompany()
        if UserDefaults.standard.integer(forKey: "id") == 0{
            UserDefaults.standard.set(1, forKey: "id")
        }
    }
    

   /* @IBAction func ImageSelect(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }*/
   
    
    @IBAction func ImageSelect(_ sender: Any) {
        //present(imagePicker, animated: true, completion: nil)
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    @IBAction func Order(_ sender: Any) {
        if(Zone.text!.isEmpty){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

        } else if(city.text!.isEmpty){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

        } else if(space.text!.isEmpty){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

        } else if(noOfRoom.text!.isEmpty){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

        } else if(noOfFloor.text!.isEmpty){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        } else if(hight.text!.isEmpty){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            

        }else if(price.text!.isEmpty){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }else{
           
            let order = NSEntityDescription.insertNewObject(forEntityName: "Orders", into: context) as! Orders
            order.id = Int32(UserDefaults.standard.integer(forKey: "id") + 1)
            order.price = Int16(price.text!) ?? 0
            order.image = ImageSelect.image
            order.typeOfFloor = self.TypeFlor
            order.companyName = self.Company
            order.noOfRom = Int16(noOfRoom.text!) ?? 0
            order.noOfFloor = Int16(noOfFloor.text!) ?? 0
            order.space = Int16(space.text!) ?? 0
            order.hight = Int16(hight.text!) ?? 0
            order.date = NSDate() as Date
            order.city = city.text
            
            do{
            context.insert(order)
               try context.save()
                UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "id") + 1, forKey: "id")
                
                print("Data insart")
            } catch {
                print("Not INsert")
            }
            let alert = UIAlertController(title: "تم", message: "تم انشاءالطلب ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
       
    }
    func setPopButtonTypeOfFloor(){
        let Op = {(action : UIAction) in self.TypeFlor = action.title}
        TypeOfFloor.menu = UIMenu(children : [
            UIAction(title : "شقة", state: .on, handler: Op),
            UIAction(title : "فيلا", handler: Op),
            UIAction(title : "عمارة", handler: Op)])
        TypeOfFloor.showsMenuAsPrimaryAction = true
        TypeOfFloor.changesSelectionAsPrimaryAction = true
    }
    func setPopButtonTypeOfCompany(){
        let Op = {(action : UIAction) in self.Company = action.title}
        company.menu = UIMenu(children : [
            UIAction(title : "العقارية", state: .on, handler: Op),
            UIAction(title : "العالمية", handler: Op),
            UIAction(title : "الاوربيه", handler: Op)])
        TypeOfFloor.showsMenuAsPrimaryAction = true
        TypeOfFloor.changesSelectionAsPrimaryAction = true
    }
    
    
    
}
extension NewOrderViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage
        {
            ImageSelect.image = image
            
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
