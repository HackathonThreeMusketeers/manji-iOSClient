//
//  Api.swift
//  manji
//
//  Created by 会津慎弥 on 2018/05/12.
//  Copyright © 2018年 会津慎弥. All rights reserved.
//

import Alamofire
import ObjectMapper

enum Api: API {
    
    case getDiary()
    case putEsa()
    
    var buildURL: URL {
        return URL(string: "\(baseURL)\(path)")!
    }
    
    var baseURL: String {
        return "http://ec2-18-191-25-206.us-east-2.compute.amazonaws.com:3000"
    }
    
    var path: String {
        switch self {
        case .getDiary(): return "/diary"
        case .putEsa: return "/esa"
        }
    }
    
    var parameters: Parameters {
        var params  = [String: Any]()
        switch self {
        case .getDiary():
            return params
        case .putEsa():
            return params
        }
    }
    
    var data: Data? {
        /*if case .uploadAttachment(filename: _, file: let file, figureType: _) = self {
            return file
        }*/
        return nil
    }
}

protocol API {
    var buildURL: URL { get }
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String: Any] { get }
    var data: Data? { get }
}
