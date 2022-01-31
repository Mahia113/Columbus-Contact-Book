//
//  ContactListViewController.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit


class ContactListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    private let sectionInsets = UIEdgeInsets(
      top: 30.0,
      left: 10.0,
      bottom: 10.0,
      right: 10.0)
    
    private let reuseIdentifier = "contactListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ContactViewCell
        
        //cell.backgroundColor = UIColor.systemGray2
        
        return cell
        
    }

}

class ContactViewCell: UICollectionViewCell{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
}
