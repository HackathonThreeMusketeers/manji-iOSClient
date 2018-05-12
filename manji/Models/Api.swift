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
    
    //case createProject(projectName: String, contentType: String)
    
    var buildURL: URL {
        return URL(string: "\(baseURL)\(path)")!
    }
    
    var baseURL: String {
        return ""
    }
    
    var path: String {
        switch self {
        //case .createProject(projectName: _, contentType: _):    return "/projects.json"
        }
    }
    
    var parameters: Parameters {
        var params  = [String: Any]()
        switch self {
        /*case .createProject(projectName: let projectName, contentType: let contentType):
            params[Constant.ProjectKeys().name] = projectName
            params[Constant.ProjectKeys().contentType] = contentType
            return params*/
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
