//
//  RestaurantTableViewController.swift
//  ece564-proj
//
//  Created by Guanwen Wang on 10/20/19.
//  Copyright © 2019 Duke University. All rights reserved.
//



import UIKit
import Moya





class RestaurantTableViewController: UITableViewController {
    //let restaurantName: [String] = ["Shanghai", "Taco Bell", "Itaewon"]
    
    let service = MoyaProvider<YelpService.BusinessesProvider>()
    let jsonDecoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 450
        
        
//        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//        loadBusinesses()
        
//        print("--------")
//        print(globalViewModels.count)
//        print("--------")
        
        
//        for oneItem in globalViewModels {
//            
//            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//            print(oneItem.name)
//            loadDetails(withId: oneItem.id!)
//
//        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
 
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    func loadDetails(withId id: String) {
        service.request(.details(id: id)) { [weak self] (result) in
            print("--------")
            print(id)
            switch result {
            case .success(let response):
                guard let strongSelf = self else { return }
                if let details = try? strongSelf.jsonDecoder.decode(Details.self, from: response.data){
                    let detailsViewModel = DetailsViewModel(details: details)
                    globalViewModelDetails.append(detailsViewModel)
//                    print(detailsViewModel)
                    print("globalViewModelDetail.count++++")
                }
               
                print(globalViewModelDetails.count)
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
        // return self.restaurantName.count
        return globalViewModels.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! RestaurantTableViewCell

        // Configure the cell...
        
        let vm = globalViewModels[indexPath.row]
        cell.configure(with: vm)
        print("=========one cell=======")
        
        
//        cell.restaurantNameLabel?.text = self.restaurantName[indexPath.row]
//        cell.locationLabel?.text = "0.3 mi"
//        cell.restaurantImage?.image = UIImage(named: self.restaurantName[indexPath.row])!
        return cell
    }
    

    /*
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
 */
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
        let destVC = segue.destination as! DetailViewController
        let myRow = tableView!.indexPathForSelectedRow
//        let currentCell = tableView!.cellForRow(at: myRow!) as! RestaurantTableViewCell
//        var row = 0
//        for oneDetail in globalViewModelDetails {
//            if oneDetail.name == currentCell.restaurantNameLabel.text {
//                break
//            }
//            row += 1
//        }
//        destVC.detail = globalViewModelDetails[row]
        destVC.detail = globalViewModels[myRow!.row]
    }
    

}
