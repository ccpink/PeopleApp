//
//  ContentView.swift
//  PeopleApp
//
//  Created by Charles Pink on 2022-07-24.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    @Environment(\.managedObjectContext) var moc
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
            
            List{
                ForEach(users){ user in
                    NavigationLink{
                        userDetailView(user: user )
                    } label :{
                        HStack{
                            Text(user.name ?? "Unkown")
                            
                            Text("Age: " + String(user.age))
                        }
                    }
                }.onDelete(perform: deleteUsers)
                
            }.navigationTitle("Users").toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add book", systemImage: "plus")
                    }
                }
                
            }.sheet(isPresented: $showingAddScreen){
                AddUserView()
            }
            
        
        }
    }
    
    func deleteUsers(at offsets: IndexSet){
        for offset in offsets{
            let user = users[offset]
            moc.delete(user)
        }
         
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
