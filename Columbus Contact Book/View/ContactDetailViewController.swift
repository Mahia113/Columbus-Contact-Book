//
//  ContactDetailViewController.swift
//  Columbus Contact Book
//
//  Created by Mahia113
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    @IBOutlet weak var viewContainerTop: UIView!
    @IBOutlet weak var viewContainerBottom: UIView!
    
    @IBOutlet weak var nameContactHeader: UILabel!
    @IBOutlet weak var phoneContactHeader: UILabel!
    
    @IBOutlet weak var nameContact: UILabel!
    @IBOutlet weak var phoneContact: UILabel!
    @IBOutlet weak var emailContact: UILabel!
    @IBOutlet weak var addressContact: UILabel!
    @IBOutlet weak var notesContact: UILabel!
    
    var contact: ContactModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customContainerTop()
        customContainerBottom()
        setValues()
    }
    
    @IBAction func backEvent(_ sender: Any) {
        
    }
    
    @IBAction func callEvent(_ sender: Any) {
        
    }
    
    @IBAction func editEvent(_ sender: Any) {
        
    }
    
    @IBAction func deleteEvent(_ sender: Any) {
        
    }
    
    func setValues(){
        
    }
    
    func customContainerTop(){
        viewContainerTop.layer.backgroundColor = UIColor.white.cgColor
        viewContainerTop.layer.cornerRadius = 20
        viewContainerTop.layer.shadowColor = UIColor.black.cgColor
        viewContainerTop.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewContainerTop.layer.shadowOpacity = 0.7
        viewContainerTop.layer.shadowRadius = 4.0
    }
    
    func customContainerBottom(){
        viewContainerBottom.layer.backgroundColor = UIColor.white.cgColor
        viewContainerBottom.layer.cornerRadius = 20
        viewContainerBottom.layer.shadowColor = UIColor.black.cgColor
        viewContainerBottom.layer.shadowOffset = CGSize(width: 3, height: 3)
        viewContainerBottom.layer.shadowOpacity = 0.7
        viewContainerBottom.layer.shadowRadius = 4.0
    }
    
}
