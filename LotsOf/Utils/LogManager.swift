//
//  LogManager.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/11/22.
//

import Foundation
import UIKit


final class LogManager {
    
    public static let shared = LogManager()
    let manager = FileManager.default
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    private var txtFileUrl: URL?
    
    init() {
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let newFolderUrl = url.appendingPathComponent("LotsOf_log")
        
        
        if !(manager.fileExists(atPath: "\(newFolderUrl)")) {
            do {
                try manager.createDirectory(at: url, withIntermediateDirectories: true, attributes: [:])
                print("createdDirectory")
            } catch let error as NSError {
                print("\(error.localizedDescription)")
            }
            
            //Crear el archivo
            let fileUrl = url.appendingPathComponent("log.txt")
            
            manager.createFile(atPath: fileUrl.path, contents: nil, attributes: [FileAttributeKey.creationDate: Date()])
            txtFileUrl = fileUrl
            
        }
    }
    
    func createLog(with logError: String) {
        // crear el texto
        
        let stringData = "\(Date()) :: \(logError)\n"
        
        //Escribir
        do {
            try stringData.write(to: self.txtFileUrl!, atomically: false, encoding: .utf8)
            print("log")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
   
    func log(_ message: String) {
        guard let data = "\(Date()) :: \(message)\n".data(using: .utf8) else { return }
        guard let logFile = txtFileUrl else { return }
        
        if manager.fileExists(atPath: "\(logFile.path)"){
            if let fileHandle = try? FileHandle(forWritingTo: logFile) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
            }
        } else {
            try? data.write(to: logFile, options: .atomicWrite)
        }
        
    }
}
