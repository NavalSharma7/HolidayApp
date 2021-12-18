//
//  CountryInfo.swift
//  HolidayApp
//
//  Created by Naval Sharma on 2021-12-07.
//

import Foundation
struct ResponseCountry : Codable {
     var response : CountryResponse
    var meta : MetaDataCountry
    
}
struct MetaDataCountry :Codable{
    
    var code: Int
}
struct CountryResponse: Codable{
    let countries : [countries]
    let url :String
    
}

struct countries: Codable{
    var country_name:String
   
    var total_holidays: Int
    var supported_languages : Int
}
