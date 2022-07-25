//
//  AddUserView.swift
//  PeopleApp
//
//  Created by Charles Pink on 2022-07-25.
//

import SwiftUI

struct AddUserView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = "";
    @State private var age = 0;
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name", text: $name)
                    Picker("Age", selection: $age){
                        ForEach(0..<200){
                            Text(String($0))
                        }
                    }
                }
                Section{
                    Button("Save"){
                        let newBook = User(context: moc)
                        newBook.id = UUID()
                        newBook.name = name
                        newBook.age = Int32(age)
                        
                        try? moc.save()
                        
                        dismiss()
                    }
                }
            }
            
        }.navigationTitle("Add user")
    }
}

struct AddUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddUserView()
    }
}
