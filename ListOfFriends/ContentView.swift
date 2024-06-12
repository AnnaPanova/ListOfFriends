//
//  ContentView.swift
//  ListOfFriends
//
//  Created by Anna Panova on 06.06.24.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State private var listOfFriends: [String] = ["John","Sam","Samanta","Marcy","Mary"]
    @State private var search: String = ""
    
    @State private var filteredListOfFriends:[String] = []
    
    
    var body: some View {
        //searchable required NavigationStack in Preview or in body
        NavigationStack {
            VStack {
                TextField("add a friend", text:$name )
                    .textFieldStyle(.roundedBorder)
                    .border(.black)
                
                //   taping finisched, we pusch name into listOfFriends
                    .onSubmit {
                        listOfFriends.append(name)
                        name = ""
                        print("name \(name) was append")
                        filteredListOfFriends = listOfFriends
                    }
                
                // put names from array with names into a List, set up id: \.self to conform protocol Identifiable
                List(filteredListOfFriends, id: \.self) { name in
                    Text(name)
                }
                //searchable required NavigationStack!
                .searchable(text: $search, prompt: "looking for somebody...")
                .onChange(of: search) {_ in
                    if search.isEmpty{
                        filteredListOfFriends = listOfFriends
                    } else {
                        filteredListOfFriends = listOfFriends.filter{$0.contains(search)}
                    }
                    
                }
                
            }
            .navigationTitle("List of my friends")
            .padding(10)
            .onAppear(perform: {
                filteredListOfFriends = listOfFriends
                print("Reload Filtered List")
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
