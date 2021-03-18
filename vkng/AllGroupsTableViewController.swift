//
//  AllGroupsTableViewController.swift
//  vkng
//
//  Created by Serg on 18.03.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    var groups = [
        Group(label: "Группа 1", icon: "1"),
        Group(label: "Группа 2", icon: "2"),
        Group(label: "Группа 3", icon: "3"),
        Group(label: "Группа 4", icon: "4"),
        Group(label: "Группа 5", icon: "1"),
        Group(label: "Группа 6", icon: "2"),
        Group(label: "Группа 7", icon: "3"),
        Group(label: "Группа 8", icon: "4"),
        Group(label: "Группа 9", icon: "1"),
    ]
    
    var selectedGroup: Group?

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "allGroups", for: indexPath) as? AllGroupsTableViewCell else { fatalError() }
        
        cell.label.text = groups[indexPath.row].label
        
        let logo = UIImage(named: groups[indexPath.row].icon)
        let newLogo = logo?.withRoundedCorners(radius: 100.0)
        
        cell.selectionStyle = .none
        cell.avatar.image = newLogo


        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedGroup = groups[indexPath.row]
        
        performSegue(withIdentifier: "addGroup", sender: self)
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
