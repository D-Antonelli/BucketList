//
//  ContentView.swift
//  BucketList
//
//  Created by Derya Antonelli on 08/12/2022.
//

import SwiftUI



struct ContentView: View {

    
    var body: some View {
        Text("Tap for file read / write")
            .onTapGesture {
                let str = "Test message"
                
                FileManager.writeToDocumentDirectory(fileName: "example.txt", content: str)
                    
                    let input = FileManager.readFromDocumentDirectory(fileName: "example.txt")
                
                    print(input)
                
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
