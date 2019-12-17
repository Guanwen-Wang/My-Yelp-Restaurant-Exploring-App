//
//  detailTableViewController.swift
//  ece564-proj
//
//  Created by Chong Xu on 11/18/19.
//  Copyright © 2019 Duke University. All rights reserved.
//

import UIKit

class detailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if rowstatus == 0{
            if asianfusion.count != 0{
                return asianfusion.count}
            else{
                return 1
            }
        }else if rowstatus == 1{
            if american.count != 0 {
                return american.count
            }else{return 1}
        }else if rowstatus == 2{
            if med.count != 0{
                return med.count}
            else{return 1}
        }else if rowstatus == 3{
            if bakeries.count != 0{
                return bakeries.count}
            else{return 1}
        }else if rowstatus == 4{
            if other.count != 0 {
                return other.count}
            else{return 1}
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailTableViewCell", for: indexPath) as! detailTableViewCell
        //configure with indexPath.row and corresponding detail[]

        // Configure the cell...
        //cell.start()
        cell.configure(with: indexPath.row)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        tableView.estimatedRowHeight = 450
    //        return UITableView.automaticDimension
            return 330
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
