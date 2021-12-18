//
//  HolidayInfo.swift
//  HolidayApp
//
//  Created by Naval Sharma on 2021-12-07.
//

import Foundation


struct Response : Codable {
     var response : HolidayResponse
    var meta : MetaData
    
}
struct MetaData :Codable{
    
    var code: Int
}
struct HolidayResponse: Codable{
    let holidays : [holidays]
    
}

struct holidays: Codable{
    var name:String
    var description: String
    var type: [String]
    var country : Dictionary<String,String>
    var date: Datedata
}

struct Datedata: Codable{
    
    var iso: String
    var datetime:Dictionary<String,Int>
}

struct HolidayQueryData: Codable{
    
    var country: String
    var year: Int
}
