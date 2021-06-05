//
//  ContatctViewModel.swift
//  todolist
//
//  Created by riswan on 05/06/21.
//

import Foundation
import Firebase

class ContactViewModel: ObservableObject {
    @Published var contacts = [Contact]()
    
    private var db = Firestore.firestore()
    
    func fetchData(){
        db.collection("contacts").addSnapshotListener{
            (response, error) in
            guard let documents = response?.documents else {
                print("no documents found")
                return
            }
            
            self.contacts = documents.map{( result ) -> Contact in
                let data = result.data();
                let documentID = result.documentID
                let name = data["name"] as? String ?? ""
                let id = documentID
                return Contact(id : id, name: name)
            }
        }
    }
    
    func AddPerson(name:String){
        do {
            _ = try db.collection("contacts").addDocument(data: ["name": name])
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func deletePerson(_ contact: Contact)  {
        do {
            _ = db.collection("contacts").document(contact.id).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
        }
    }
    
    func updatePerson(_ id:String, _ name:String) {
        let data = [
                "name": name,
            ]
        do {
            try db.collection("contacts").document(id).updateData(data)
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
