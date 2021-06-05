//
//  Contact.swift
//  todolist
//
//  Created by riswan on 05/06/21.
//

import SwiftUI

struct Contact:Codable, Identifiable {
    var id:String = UUID().uuidString
    var name: String? = ""
    var documentId = ""
}
