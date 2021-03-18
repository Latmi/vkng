//
//  FriendsTableViewController.swift
//  vkng
//
//  Created by Serg on 17.03.2021.
//

import UIKit
import Foundation

class FriendsTableViewController: UITableViewController {
    
    
    
    var friends = [
        Friend(name: "Александр Терещенков", image: "1"),
        Friend(name: "Марьяна Лисицина", image: "2"),
        Friend(name: "Валерия Иванова", image: "3"),
        Friend(name: "Светлана Ковалевская", image: "4"),
    ]
    
    var selectedFriend: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedFriend = friends[indexPath.row].name
        performSegue(withIdentifier: "toImages", sender: self)
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendListCell", for: indexPath) as? FriendTableViewCell else { fatalError() }
        
        cell.name.text = friends[indexPath.row].name
        
        let logo = UIImage(named: friends[indexPath.row].image)
        let newLogo = logo?.withRoundedCorners(radius: 100.0)
        
        
        cell.selectionStyle = .none
        cell.photo.image = newLogo
        
        return cell

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "toImages", let destination = segue.destination as? FriendsCollectionViewController {
            
            destination.title = selectedFriend
            
        }
    }

}


extension UIImage {
    public func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
        let maxRadius = min(size.width, size.height) / 2
        let cornerRadius: CGFloat
        if let radius = radius, radius > 0 && radius <= maxRadius {
            cornerRadius = radius
        } else {
            cornerRadius = maxRadius
        }
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let rect = CGRect(origin: .zero, size: size)
        UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
