//
//  ContactView.swift
//  todolist
//
//  Created by riswan on 05/06/21.
//
import SwiftUI

struct ContactView: View {
    @State private var name:String = ""
    @State private var id:String = ""
    @State private var isEdit:Bool = false
    @ObservedObject private var viewModel = ContactViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.contacts) { contact in
                HStack () {
                    VStack(alignment: .leading) {
                        Text(contact.name ?? "")
                    }
                    Spacer()
                    HStack {
                        Button(action:{}) {
                            HStack {
                                Image(systemName: "trash").onTapGesture {
                                    self.viewModel.deletePerson(contact)
                                }
                                    .font(.system(size: 20))
                            }
                        }
                    }
                    HStack {
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "pencil.circle")
                                    .onTapGesture {
                                        name = contact.name ?? ""
                                        id = contact.id 
                                        isEdit = true
                                    }
                                    .font(.system(size: 20))
                            }
                        }
                    }
                }
            }.onAppear() {
                self.viewModel.fetchData();
            }
            .navigationTitle("List Person")
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                HStack {
                    TextField("Enter new Person", text: $name)
                        .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                    Spacer()
                    Button(action: {
                        if(isEdit) {
                            self.viewModel.updatePerson(id, name)
                            isEdit = false
                            id = ""
                        } else {
                            self.viewModel.AddPerson(name: name)
                        }
                        name = ""
                    }) {
                        HStack {
                            Image(systemName: "plus")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(40)
                    }
                }
            }
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}

