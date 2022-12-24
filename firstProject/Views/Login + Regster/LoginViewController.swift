//
//  LoginViewController.swift
//  firstProject
//
//  Created by Saleh Naser on 17/12/2022.
//

import UIKit
import CoreData
class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        if(txtEmail.text!.isEmpty){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

        } else if(txtPassword.text!.isEmpty){
            let alert = UIAlertController(title: "تنبية", message: "جميع الحقول مطلوبة", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)

        } else {
            let fetchRequest : NSFetchRequest<Users> = Users.fetchRequest()
            do{
                let results = try context.fetch(fetchRequest)
                for result in results {
                    if(txtEmail.text == result.email && txtPassword.text == result.password){
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabbarCV")
                        navigationController?.pushViewController(vc!, animated: true)
                        print("Email :" + result.email!)
                        print("Password :" + result.password!)
                    }else{
                       /* */
                       // alertA()
                    }
                }
                
                

            } catch {
                print(error)
            }
            
        }
        
    }
    
    func alertA(){
        let alert = UIAlertController(title: "خطأ", message: "تأكد من البيانات", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "حسنآ", style: .default, handler: nil))
         present(alert, animated: true, completion: nil)
    }
}

