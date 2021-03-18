//
//  FriendsCollectionViewController.swift
//  vkng
//
//  Created by Serg on 17.03.2021.
//

import UIKit

class FriendsCollectionViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var friendsCollection: UICollectionView!
    
    var friendImages = [
        FriendImages(image: "1"),
        FriendImages(image: "2"),
        FriendImages(image: "3"),
        FriendImages(image: "4"),
        FriendImages(image: "1"),
        FriendImages(image: "2"),
        FriendImages(image: "3"),
        FriendImages(image: "4"),
        FriendImages(image: "1"),
        FriendImages(image: "2"),
        FriendImages(image: "3"),
        FriendImages(image: "4"),
        FriendImages(image: "1"),
        FriendImages(image: "2"),
        FriendImages(image: "3"),
        FriendImages(image: "4"),
        FriendImages(image: "1"),
        FriendImages(image: "2"),
        FriendImages(image: "3"),
        FriendImages(image: "4"),
        FriendImages(image: "1"),
        FriendImages(image: "2"),
        FriendImages(image: "3"),
        FriendImages(image: "4"),
        FriendImages(image: "1"),
        FriendImages(image: "2"),
        FriendImages(image: "3"),
        FriendImages(image: "4"),
        FriendImages(image: "1"),
        FriendImages(image: "2"),
        FriendImages(image: "3"),
        FriendImages(image: "4"),
        FriendImages(image: "1"),
        FriendImages(image: "2"),
        FriendImages(image: "3"),
        FriendImages(image: "4"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsCollection.delegate = self
        friendsCollection.dataSource = self
        
    }
    
}

extension FriendsCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        friendImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = friendsCollection.dequeueReusableCell(withReuseIdentifier: "friendCollectionCell", for: indexPath) as? FriendCollectionCell else { fatalError() }
        
        cell.imageLogo.image = UIImage(named: friendImages[indexPath.item].image)
        
        return cell
    }
    
}

extension FriendsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 3 - 1
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
}
