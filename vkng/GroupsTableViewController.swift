//
//  GroupsTableViewController.swift
//  vkng
//
//  Created by Serg on 18.03.2021.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    
    var groups = [Group]()

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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groups", for: indexPath) as? GroupsTableViewCell else { fatalError() }
        
        cell.label.text = groups[indexPath.row].label
        
        let logo = UIImage(named: groups[indexPath.row].icon)
        let newLogo = logo?.withRoundedCorners(radius: 100.0)
        
        cell.selectionStyle = .none
        cell.avatar.image = newLogo


        return cell
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup", let sourceAllGroupsVC = segue.source as? AllGroupsTableViewController, let selectedGroup = sourceAllGroupsVC.selectedGroup {
            print(groups.filter({$0.label == selectedGroup.label}).count)
            if groups.filter({$0.label == selectedGroup.label}).count == 0 {
                
                groups.append(selectedGroup)
                tableView.reloadData()
            }
            
        }
    }
    
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

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
