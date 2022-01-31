//
//  ContactListViewController.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit

class ContactListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private let reuseIdentifier = "contactListCell"
        
    var listContacts: [ContactModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("lista de contactos: \(listContacts)")
    }
    
    @IBAction func backEvent(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listContacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ContactViewCell
                
        cell.nameLabel.text = listContacts[indexPath.row].name
        cell.phoneLabel.text = listContacts[indexPath.row].phone
        
        return cell
    }

}

class ContactViewCell: UICollectionViewCell{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
}
