//
//  CategoriesTableViewController.swift
//  ece564-proj
//
//  Created by Chong Xu on 11/18/19.
//  Copyright © 2019 Duke University. All rights reserved.
//

import UIKit
import Moya
import MapKit
import CoreLocation

class CategoriesTableViewController: UITableViewController {
    
    let service = MoyaProvider<YelpService.BusinessesProvider>()
    let jsonDecoder = JSONDecoder()
    //let vc = CategoriesViewController.self
    override func viewDidLoad() {
        super.viewDidLoad()
        /*for item in globalViewModels{
            let vm = item
            loadDetails(withId: vm.id!)
        }*/
        loadDetails()

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
        return 5 //5 categories
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print("\n\n=========in categories====\n\n")
        //let catVC = storyboard?.instantiateViewController(withIdentifier: "CategoryTableViewController") ?? UIViewController()
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoriesTableViewCell

        // Configure the cell...
        
        
        cell.configure(with: indexPath.row)
        /*print("=========one cell=======")
        print("\n\n\(vm.categories)\n\n")*/

        return cell
    }
    /*func loadDetails(withId id: String) {
        service.request(.details(id: id)) { [weak self] (result) in
            switch result {
            case .success(let response):
                //print("\n======\(response.data)========\n\n")
                guard let strongSelf = self else { return }
                if let details = try? strongSelf.jsonDecoder.decode(Details.self, from: response.data) {
                    //print("\n\n=====in it====\n\n")
                    let detailsViewModel = DetailsViewModel(details: details)
                    
                    for cats in detailsViewModel.categories{
                        //print("\n\n\n=========cats title: \(cats.title)=====\n\n")
                        if cats.title.contains("Asian"){
                            asianfusion.append(detailsViewModel)
                        }else if cats.title.contains("American"){
                            american.append(detailsViewModel)
                        }else if cats.title.contains("Bakeries") || cats.title.contains("Desserts"){
                            var tmp:[String] = []
                            for d in bakeries{
                                tmp.append(d.name ?? "name")
                            }
                            if !tmp.contains(detailsViewModel.name ?? "name"){
                                bakeries.append(detailsViewModel)
                            }
                        }else if cats.title == "Mediterranean"{
                            var tmp:[String] = []
                            for d in med{
                                tmp.append(d.name ?? "name")
                            }
                            if !tmp.contains(detailsViewModel.name ?? "name"){
                                med.append(detailsViewModel)
                            }
                        }else{
                            var tmp:[String] = []
                            for d in other{
                                tmp.append(d.name ?? "name")
                            }
                            if !tmp.contains(detailsViewModel.name ?? "name"){
                                other.append(detailsViewModel)
                            }
                        }
                        
                    }
                    //print("\n\n\n\(asianfusion)\n\n")
                    print("\n\n\n------------\n\(details)\n\n")
                }
            case .failure(let error):
                print("Failed to get details \(error)")
            }
        }
    }*/
    func loadDetails(){
        for detailsViewModel in globalViewModels{
            print("\n\n=====details: \(detailsViewModel)\n\n")
            for cats in detailsViewModel.categories{
            //print("\n\n\n=========cats title: \(cats.title)=====\n\n")
                if cats.title.contains("Asian") || cats.title.contains("Korean") || cats.title.contains("Japanese"){
                var tmp:[String] = []
                for d in asianfusion{
                    tmp.append(d.name ?? "name")
                }
                if !tmp.contains(detailsViewModel.name ?? "name"){
                    asianfusion.append(detailsViewModel)
                }
            }else if cats.title.contains("American"){
                var tmp:[String] = []
                for d in american{
                    tmp.append(d.name ?? "name")
                }
                if !tmp.contains(detailsViewModel.name ?? "name"){
                    american.append(detailsViewModel)
                }
            }else if cats.title.contains("Bakeries") || cats.title.contains("Desserts"){
                var tmp:[String] = []
                for d in bakeries{
                    tmp.append(d.name ?? "name")
                }
                if !tmp.contains(detailsViewModel.name ?? "name"){
                    bakeries.append(detailsViewModel)
                }
            }else if cats.title == "Mediterranean"{
                var tmp:[String] = []
                for d in med{
                    tmp.append(d.name ?? "name")
                }
                if !tmp.contains(detailsViewModel.name ?? "name"){
                    med.append(detailsViewModel)
                }
            }else{
                var tmp:[String] = []
                for d in other{
                    tmp.append(d.name ?? "name")
                }
                if !tmp.contains(detailsViewModel.name ?? "name"){
                    other.append(detailsViewModel)
                }
            }
        }
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        tableView.estimatedRowHeight = 450
    //        return UITableView.automaticDimension
            return 330
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        rowstatus = indexPath.row
        
        //...
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
