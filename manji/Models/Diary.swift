//
//  Diary.swift
//  manji
//
//  Created by 会津慎弥 on 2018/05/13.
//  Copyright © 2018年 会津慎弥. All rights reserved.
//

import Foundation
import ObjectMapper

struct Diary: Mappable {
    
    var date: String = ""
    var imageURL: String = ""
    var temperature: String = ""
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        date    <- map["date"]
        imageURL   <- map["image"]
        temperature <- map["temperature"]
    }
    
    func getThumbImg() -> UIImage {
        
        var image = UIImage()
        
        let url = URL(string: "http://ec2-18-191-25-206.us-east-2.compute.amazonaws.com:3000/images/" + imageURL)!
        let imageData = try? Data(contentsOf: url)
        image = UIImage(data: imageData!)!
        
        return image
    }
    
    func getDate() -> Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let localDate = formatter.date(from: date)
        return localDate!
    }
}
