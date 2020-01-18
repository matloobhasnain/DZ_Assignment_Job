//
//  NetworkLayer.swift
//  DZ_Test_iOS
//
//  Created by PureLogics on 16/01/2020.
//  Copyright © 2020 Matloob Hasnain. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
enum Constants {
    enum URL {
        static let completeURLWithEndPoints = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer"
    }
}

final class NetworkLayer: NSObject {

    static let sharedInstance = NetworkLayer()
    
    private override init() { }
    
    func fetchProduct(success: @escaping (ProductListing?) -> Void, failure: @escaping (String?) -> Void) {
        
        let url = Constants.URL.completeURLWithEndPoints
        AF.request(url, method: .get, parameters: [:], encoding: URLEncoding.default, headers:nil).responseJSON { (response) in
            switch response.result {
            case let .success(value):
                let responseModel = Mapper<ProductListing>().map(JSONObject:value)
                success(responseModel)

            case let .failure(error):
                failure(error.errorDescription)
            }
        }
    }
    
    
}
