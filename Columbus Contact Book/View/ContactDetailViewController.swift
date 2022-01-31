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
    var contact: ContactModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customContainerTop()
        customContainerBottom()
        
        print("contact: \(contact)")
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
