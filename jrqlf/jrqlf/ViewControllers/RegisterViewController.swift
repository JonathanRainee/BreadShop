//
//  RegisterViewController.swift
//  jrqlf
//
//  Created by prk on 29/04/23.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        // Do any additional setup after loading the view.
    }
    
    var context:NSManagedObjectContext!
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confPassTF: UITextField!
    @IBAction func registerBtn(_ sender: Any) {
        
        let username = usernameTF.text!
        let password = passwordTF.text!
        let confPass = confPassTF.text!
        
        if(username.isEmpty || password.isEmpty || confPass.isEmpty){
            return
        }
        if(password != confPass){
            return
        }
        if(password.count < 8){
            return
        }
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)!
        
        let newUser = NSManagedObject(entity: entity, insertInto: context)
        newUser.setValue(username, forKey: "username")
        newUser.setValue(password, forKey: "password")
        
        do {
            try context.save()
            if let nextView = storyboard?
                .instantiateViewController(withIdentifier: "LoginViewController") {
                navigationController?.pushViewController(nextView, animated: true)
            }
        }
        catch{
            print("insert failed")
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
