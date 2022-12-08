//
//  FileManagerExtension.swift
//  BucketList
//
//  Created by Derya Antonelli on 08/12/2022.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    static func readFromDocumentDirectory(fileName: String) -> String {
        do {
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            let content = try String(contentsOf: fileURL)
            return content
        } catch {
            print(error.localizedDescription)
        }
        return ""
    }
    
    static func writeToDocumentDirectory(fileName: String, content: String) {
        do {
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            try content.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print(error.localizedDescription)
        }

    }
}
