//
//  ManagerWorkTableViewController.swift
//  WorkManagingApp
//
//  Created by David Perez on 6/4/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ManagerWorkTableViewController: UITableViewController {
    
    var db: Firestore!
    var workItems = [workObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        view.layer.cornerRadius = 5
        view.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.layer.masksToBounds = true
        loadData()
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.register(ManagerWorkTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    func loadData() {
       
        let user =  String(describing: Auth.auth().currentUser!.uid)

       
            
         db.collection("user").document(user).collection("taskCollection").getDocuments(){ querySnapshot, error in

            if let error = error {
                print("\(error.localizedDescription)")
            }else{
                
                self.workItems = querySnapshot!.documents.flatMap({workObject(dictionary:$0.data())})
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    print(self.workItems)
                    print(user)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return workItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ManagerWorkTableViewCell
        cell.layer.cornerRadius = 10
        // Configure the cell...
        let workItem = workItems[indexPath.row]
      //  cell.textLabel?.text = "\(workItem.jobDescription)"
        cell.descriptionTextView.text = "\(workItem.jobDescription)"
        cell.priceTextView.text = "\(workItem.jobPrice)"
        cell.timeTextView.text = "\(workItem.jobTime)"
        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
