//
//  ContactListViewController.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit

class ContactListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, ContactListViewControllerDelegate {
    
    private let reuseIdentifier = "contactListCell"
    var listContacts: [ContactModel] = []
    private let contactListPresenter = ContactListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactListPresenter.setViewDelegate(contactListViewControllerDelegate: self)
    }
    
    @IBAction func backEvent(_ sender: Any) {
        contactListPresenter.dissmisController(controller: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listContacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ContactViewCell
        
        cell.nameLabel.text = listContacts[indexPath.row].name
        cell.phoneLabel.text = listContacts[indexPath.row].phone
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        contactListPresenter.goToContactDetails(contact: listContacts[indexPath.row], controller: self)
    }

}

class ContactViewCell: UICollectionViewCell{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
}
