//
//  EventTableViewController.swift
//  ece564-proj
//
//  Created by Yunhe Wang on 11/16/19.
//  Copyright © 2019 Duke University. All rights reserved.
//

import UIKit
import Moya

var globalEventViewModels = [EventListViewModel]()
var globalViewModelEventDetails = [eventDetailsViewModel]()
//var alreadySorted: Bool = false

class EventTableViewController: UITableViewController {
    
    let service = MoyaProvider<YelpService.EventsProvider>()
    let jsonDecoder = JSONDecoder()
//    var eventViewModels = [EventListViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for oneItem in globalEventViewModels {
//            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//            loadDetails(withId: oneItem.id!)
//        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadDetails(withId id: String) {
        service.request(.details(id: id)) { [weak self] (result) in
            switch result {
            case .success(let response):
                guard let strongSelf = self else { return }
                print("id: \(id)")
                print(response)
                if let details = try? strongSelf.jsonDecoder.decode(eventDetails.self, from: response.data) {
                    let detailsViewModel = eventDetailsViewModel(eventDetails: details)
                    globalViewModelEventDetails.append(detailsViewModel)
                    print(detailsViewModel)
                    print("globalViewModelEventDetails.count++++")
                }
               
                print(globalViewModelEventDetails.count)
                print("--------")
                
            case .failure(let error):
                print("Failed to get details \(error)")
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return globalEventViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell

        // Configure the cell...
        
        let vm = globalEventViewModels[indexPath.row]
        cell.configure(with: vm)
        print("-------------one cell-------------")
        
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
//        if (alreadySorted == false) {
//            globalViewModelEventDetails.sort(by: {$0.name! < $1.name!})
//            print("globalViewModelEventDetails: \(globalViewModelEventDetails)")
//            alreadySorted = true
//        }
        
        let destVC = segue.destination as! EventDetailViewController
        let myRow = tableView!.indexPathForSelectedRow
//        let currentCell = tableView!.cellForRow(at: myRow!) as! EventTableViewCell
//        print("myRow: \(myRow!.row)")
//        print("gVME: \(globalViewModelEventDetails.count)")
        destVC.detail = globalEventViewModels[myRow!.row]
    }
    

}
