//
//  MoyaNetwork.swift
//  test
//
//  Created by 张文超 on 2018/11/8.
//  Copyright © 2018年 张文超. All rights reserved.
//

import UIKit
import Moya

    //请求枚举
    enum moyaApi {
        case login(phoneNum: NSInteger,passWord: NSInteger)
        case logout
    }

//网络请求设置
extension moyaApi: TargetType{
    
    //请求头
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
    //请求服务器根路径
    var baseURL: URL {
        return URL(string: "ServiceBaseURL")!
    }
    //每个API对应的具体路径
    var path: String {
        switch self {
        case .login(_, _):
            return "accountService/login"
        case .logout:
            return "accountService/logout"
        }
    }
    
    //请求的方式 get/post
    var method: Moya.Method {
        switch self {
        case .login(_, _):
            return .post
        case .logout:
            return .get
        }
    }
    
    //请求参数
    var parameters: [String: Any]? {
        switch self {
        case .login(let phoneNum, let passWord):
            return ["phoneNum": phoneNum, "passWord": passWord]
        case .logout:
            return nil
        }
    }
    
    //转码方式
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default // Send parameters as JSON in request body
    }
    
    //请求任务
    var task: Task {
        
        switch self {
        case let .login(phoneNum, passWord): return.requestParameters(parameters:["phoneNum":phoneNum,"passWord":passWord], encoding: URLEncoding.default)
            
        case .logout:   return.requestPlain
            
        }
        
        
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
}



