//
//  NetworkManager.swift
//  AlamofireExample
//
//  Created by AL on 15/05/2018.
//  Copyright © 2018 Alban. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getPhotos(_ callBack:@escaping ([Photo])->()) {
        
        Alamofire.request("https://jsonplaceholder.typicode.com/photos").responseJSON { response in
            
            if let data = response.data,
                let photos = try? JSONDecoder().decode(Array<Photo>.self, from: data) {
                
                callBack(photos)
                
            }
        }
    }

}
