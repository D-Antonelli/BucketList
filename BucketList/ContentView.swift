//
//  ContentView.swift
//  BucketList
//
//  Created by Derya Antonelli on 08/12/2022.
//

import SwiftUI



struct ContentView: View {
    private var fileName = "example.txt"
    var body: some View {
        Text("Tap for file read / write")
            .onTapGesture {
                let str = "Test message"
                
                FileManager.writeDocument(fileName: fileName, content: str) {
                    result in
                    if let result = result {
                        print(result.localizedDescription)
                    }
                }
                
                FileManager.readDocument(fileName: fileName) {
                    result in
                    
                    switch result {
                    case .success(let content):
                        print(content)
                    case .failure(let error):
                        print(error)
                    }
                    
                }
                
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
