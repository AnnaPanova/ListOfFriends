//
//  ContentView.swift
//  ListOfFriends
//
//  Created by Anna Panova on 06.06.24.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var listOfFriends: [String] = []
    
    
    var body: some View {
        VStack {
            TextField("name of friend", text:$name )
                .textFieldStyle(.roundedBorder)
                .border(.black)
            
            // taping finisched, we pusch name into listOfFriends
                .onSubmit {
                    listOfFriends.append(name)
                    name = ""
                }
            Spacer()
            List(listOfFriends, id: \.self) { name in
                Text(name)
            }
        }
       
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
