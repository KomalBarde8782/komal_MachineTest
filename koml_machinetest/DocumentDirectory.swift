//
//  DocumentDirectory.swift
//  koml_machinetest
//
//  Created by Komal Barde on 18/03/2020.
//  Copyright © 2020 Script Lanes. All rights reserved.
//

import Foundation
import UIKit
class VBDocumentDirectoryManager{
    static let sharedInstance = VBDocumentDirectoryManager()
    // MARK:Saving image data in document directrory for it url hash value
     func saveImageToDocumentDirectory(imageData: Data?,fileName:String){
        
        if fileName == ""{
            return
        }
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let hashValue = "\(fileName.hashValue)"
        let imagefileURL = documentsDirectory.appendingPathComponent(hashValue)
         print("save imagefileURL = \(imagefileURL)")
        
        if let data = imageData{
            do {
                try data.write(to: imagefileURL)
                print("file saved")
            } catch {
                print("error saving file:", error)
            }
        }
    }
    
    
     func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    //MARK: Get Image from Document Directory :
    func getImage(urlStr:String)->UIImage?{
        if urlStr == ""{
            return nil
        }
        let fileManager = FileManager.default
        let hashValue = "\(urlStr.hashValue)"
        let imagepath = (self.getDirectoryPath() as NSString).appendingPathComponent(hashValue)
        print("get imagepath = ",imagepath)
        if fileManager.fileExists(atPath: imagepath){
            if let image =  UIImage(contentsOfFile: imagepath){
                return image
            }else{
                return nil
            }
        }else{
            print("No Image")
            return nil
        }
    }
    
} // end of class
