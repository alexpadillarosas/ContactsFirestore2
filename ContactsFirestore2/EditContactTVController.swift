//
//  EditContactTVController.swift
//  ContactsFirestore2
//
//  Created by alex on 30/3/2023.
//

import UIKit

class EditContactTVController: UITableViewController {

    var contact : Contact!
    
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //round the image
        contactImageView.layer.cornerRadius = contactImageView.frame.size.width / 2
        contactImageView.clipsToBounds = true
        contactImageView.layer.borderWidth = 2.0
        contactImageView.layer.borderColor = UIColor.white.cgColor
        
        if !contact.photo.isEmpty {
            if UIImage(named: contact.photo) != nil {
                contactImageView.image = UIImage(named: contact.photo)
            }
        }
        
        firstnameTextField.text = "\(contact.name)"
        positionTextField.text = "\(contact.position)"
        emailTextField.text = "\(contact.email)"
        phoneTextField.text = "\(contact.phone)"
    }
/*
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let contactsTVController = segue.destination as? ContactsTVController {
            //Set the altered data in our local contact object
            contact.name = firstnameTextField.text!
            contact.phone = phoneTextField.text!
            contact.email = emailTextField.text!
            contact.position = positionTextField.text!
            //finally we set it to the ContactsTVController
            contactsTVController.selectedContact = contact
            
        }
    }
    

}
