//
//  CCBDataPersistence.swift
//  Columbus Contact Book
//
//  Created by Mahia113 
//

import Foundation
import CoreData
import UIKit

public struct CCBDataPersistence {
    
    private let client: CCBManager
    private var managedContext: NSManagedObjectContext
    private var entity: NSEntityDescription
        
    public init(client: CCBManager){
        self.client = client
    
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        managedContext = appDelegate!.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
    }
        
    public func addContact(data: Dictionary<String, String>) -> Bool {
        
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        
        person.setValue(data["name"], forKey: "name")
        person.setValue(data["email"], forKey: "email")
        person.setValue(data["phone"], forKey: "phone")
        person.setValue(data["notes"], forKey: "notes")
        person.setValue(data["address"], forKey: "address")

        var people: [NSManagedObject] = []
        
        do {
          try managedContext.save()
            people.append(person)
            return true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            return false
        }
        
    }
    
    public func getContacts() -> [ContactModel] {
     
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        var people: [NSManagedObject] = []
        
        var contactsList: [ContactModel] = []
        
        do {
            
            people = try managedContext.fetch(fetchRequest)
            
            for (index, person) in people.enumerated() {
                                
                let contact = ContactModel(
                    name: person.value(forKey: "name") as! String,
                    phone: person.value(forKey: "phone") as! String,
                    email: person.value(forKey: "email") as! String,
                    address: person.value(forKey: "address") as! String,
                    notes: person.value(forKey: "notes") as! String)
                
                contactsList.append(contact)
            }
                        
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return contactsList
    }
    
    public func getContact(email: String) -> NSManagedObject {
        
        var person: NSManagedObject = NSManagedObject()

        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Person")
        fetchRequest.predicate = NSPredicate(format: "email = '\(NSString(string: email))'")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            person = result[0] as! NSManagedObject
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return person
    }
    
    public func updateContact(email: String, data: ContactModel) -> Bool {
        
        var person: NSManagedObject = NSManagedObject()
                
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Person")
        fetchRequest.predicate = NSPredicate(format: "email = %@", email)
        
        do{
        
            let result = try managedContext.fetch(fetchRequest)
            person = result[0] as! NSManagedObject
            
            person.setValue(data.name, forKey: "name")
            person.setValue(data.email, forKey: "email")
            person.setValue(data.phone, forKey: "phone")
            person.setValue(data.address, forKey: "address")
            person.setValue(data.notes, forKey: "notes")

            do{
                try managedContext.save()
                return true
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
                return false
            }
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
    
    public func deleteContact(email: String) -> Bool {
        var person: NSManagedObject = NSManagedObject()
                
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Person")
        fetchRequest.predicate = NSPredicate(format: "email = %@", email)
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            person = result[0] as! NSManagedObject

            managedContext.delete(person)
            
            do {
                try managedContext.save()
                return true
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
                return false
            }

        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
    }
    
}

