//
//  userDetailView.swift
//  PeopleApp
//
//  Created by Charles Pink on 2022-07-25.
//

import SwiftUI

struct userDetailView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    let user: User
    
    @State private var name = "";
    @State private var age = 0;
    
    var body: some View {
        NavigationView{
            
            Form{
                TextField(user.name ?? "Unkown", text: $name)
                Picker( String(user.age), selection: $age){
                    ForEach(0..<200){
                        Text(String($0))
                    }
                }
                Button("Save"){
                    user.name = name
                    user.age = Int32(age)
                    try? moc.save()
                    dismiss()
                }
                
            }
        }
    }
}


