//
//  RegsterViewController.swift
//  firstProject
//
//  Created by Saleh Naser on 17/12/2022.
//

import UIKit
import CoreData
class RegsterViewController: UIViewController {
   
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtSurePassword: UITextField!
    var switchClick = false
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.integer(forKey: "id") == 0{
            UserDefaults.standard.set(1, forKey: "id")
        }
    }
    
    @IBAction func SwitchBtn(_ sender: UISwitch) {
        if(sender.isOn == true){
            switchClick = true
        }
    }
    
    @IBAction func RegsterBtn(_ sender: Any) {
        if(txtUserName.text!.isEmpty){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

        } else if(txtEmail.text!.isEmpty){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

        } else if(txtPhone.text?.count != 7){
            let alert = UIAlertController(title: "تنبية", message: "الرجاء ادخال الهاتف صحيح", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

        } else if(txtPassword.text!.isEmpty){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

        } else if(txtSurePassword.text!.isEmpty){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        } else if(txtPassword.text != txtSurePassword.text){
                let alert = UIAlertController(title: "تنبية", message: "الرجاء تآكيد كلمة المرور", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            

        }else if(switchClick == false){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }else{
            let user = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context) as! Users
            user.id = Int32(UserDefaults.standard.integer(forKey: "id") + 1)
            user.username = txtUserName.text
            user.email = txtEmail.text
            user.phone = Int64(txtPhone.text!) ?? 0
            user.password = txtPassword.text
            
            do{
            context.insert(user)
               try context.save()
                UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "id") + 1, forKey: "id")
                txtUserName.text = ""
                txtEmail.text = ""
                txtPhone.text = ""
                txtPassword.text = ""
                txtSurePassword.text = ""
                print("Data insart")
            } catch {
                print("Not INsert")
            }
            let alert = UIAlertController(title: "تم", message: "تم انشاءالطلب ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
           
            //UserDefaults.standard.hasOnboarded = true
           // present(controller, animated: true, completion: nil)
            /*let fetchRequest : NSFetchRequest<Users> = Users.fetchRequest()
            do{
                let results = try context.fetch(fetchRequest)
                for result in results {
                    context.delete(result)
                }
                try context.save()
                print("Success Delet")

            } catch {
                print(error)
            }*/
            
            
            
            
            
          
        }
    

}
}
