//
//  FriendsTableViewController.swift
//  vkng
//
//  Created by Serg on 17.03.2021.
//

import UIKit

class FriendsListViewController: UIViewController {
    
    @IBOutlet weak var friendsTableViiew: UITableView!

    
    var friends = [
        Friend(name: "Александр Терещенков", image: "1"),
        Friend(name: "Марьяна Лисицина", image: "2"),
        Friend(name: "Валерия Иванова", image: "3"),
        Friend(name: "Светлана Ковалевская", image: "4"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsTableViiew.dataSource = self
        friendsTableViiew.delegate = self
        friendsTableViiew.rowHeight = 90;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        print(#function)
        
//        if segue.identifier == "friendsCollectionSegue",
//           let cell = sender as? FriendCell,
//           let destination = segue.destination as? FriendsCollectionViewController {
//            destination.name = cell.nameLabel.text
//        }
    }
    
}

extension FriendsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friends.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendCell = friendsTableViiew.dequeueReusableCell(withIdentifier: "friendsCell") as? FriendCell else { fatalError() }
        
        friendCell.nameLabel.text = friends[indexPath.row].name
        
        let logo = UIImage(named: friends[indexPath.row].image)
        let newLogo = logo?.withRoundedCorners(radius: 100.0)
        
        friendCell.selectionStyle = .none
        
        friendCell.friendLogo.image = newLogo
        
        return friendCell
    }
}

extension FriendsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // обработка нажатий
        print(indexPath)
        
        
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
