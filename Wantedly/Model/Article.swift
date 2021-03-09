//
//  Article.swift
//  Sample
//
//  Created by 藤田優作 on 2021/03/05.
//

import Foundation

struct Article: Decodable {
    let data:[Data]
}
struct Data: Decodable {
    let title: String
    let description:String
    let looking_for:String
    let image:Image
    let company:Company
    let staffings:[Staffing]
}

struct Staffing:Decodable {
    let description:String
}

struct Image: Decodable {
    let i_320_131:String

}

struct Company:Decodable {
    let name:String
    let founder:String
    let avatar:Avatar
}

struct Avatar:Decodable {
    let original:String
}



