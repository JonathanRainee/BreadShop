//
//  LoginViewController.swift
//  jrqlf
//
//  Created by prk on 29/04/23.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

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
    
    @IBAction func loginBtn(_ sender: Any) {
        let username = usernameTF.text!
        let password = passwordTF.text!
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        // kondisi
        request.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
        
        // ambil data dari text field
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            if result.count == 0 {
                print("Login Failed")
            } else {
                if let nextView = storyboard?
                    .instantiateViewController(withIdentifier: "HomeViewController") {
                    navigationController?.pushViewController(nextView, animated: true)
                }
            }
        } catch {
            
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
