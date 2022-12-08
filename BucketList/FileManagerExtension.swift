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
    
    static func readDocument(fileName: String, completion: (Result<String, Error>)  -> Void) {
        let fileURL = documentDirectory.appendingPathComponent(fileName)
        do {
            let content = try String(contentsOf: fileURL)
            completion(.success(content))
        } catch {
            completion(.failure(error))
        }
    }
    
    static func writeDocument(fileName: String, content: String, completion: (Error?) -> Void) {
        do {
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            try content.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            completion(error)
        }

    }
}
