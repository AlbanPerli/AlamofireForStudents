//
//  Photo.swift
//  AlamofireExample
//
//  Created by AL on 15/05/2018.
//  Copyright © 2018 Alban. All rights reserved.
//

import Foundation

struct Photo:Decodable {
    var albumId:Int
    var id:Int
    var title:String
    var url:String
    var thumbnailUrl:String
}
