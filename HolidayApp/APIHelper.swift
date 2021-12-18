//
//  APIHelper.swift
//  HolidayApp
//
//  Created by Naval Sharma on 2021-12-07.
//

import Foundation



struct APIHelper{
    static var  session: URLSession = {
           let config = URLSessionConfiguration.default
           return  URLSession(configuration: config)
       }()
    
    
    
    static func getHolidayList(country : String, year: Int, completion: @escaping(Response) -> Void){
        
     
        let url = URL(string: "https://calendarific.com/api/v2/holidays?api_key=a90c5506798ec879722ab2118542a928955410fa&country=\(country)&year=\(year)");
        
        
        let request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        
        
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            
            print("Starting data filtering")
            
            if let data = data{
//                if let jsonString = String(data: jsonData, encoding: .utf8){
//                    print(jsonString)
                do{
                    let decoder = JSONDecoder()
                    let holidays = try decoder.decode(Response.self, from: data)
                    
                    OperationQueue.main.addOperation {
                        completion(holidays)
                    }
                } catch let error {
                    print("Error creating json object: \(error)")
                }
            }else if let requestError = error{
                print("Error fetching data:\(requestError)")
            }
            else{
                print("Unexpected error with the request")
            }
            
        }
        
        task.resume()
        
    }
    
    static  func getCountriesList(completion: @escaping([countries]) -> Void){

    let url = URL(string: "https://calendarific.com/api/v2/countries?api_key=a90c5506798ec879722ab2118542a928955410fa")

    let request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
           
           
           
           let task = session.dataTask(with: request){
               (data, response, error) -> Void in
               
               print("Starting data filtering")
               
               if let data = data{
    //
                   do{
                       let decoder = JSONDecoder()
                       let countries = try decoder.decode(ResponseCountry.self, from: data)
                       
                       OperationQueue.main.addOperation {
                           completion(countries.response.countries)
                       }
                   } catch let error {
                       print("Error creating json object: \(error)")
                   }
               }else if let requestError = error{
                   print("Error fetching data:\(requestError)")
               }
               else{
                   print("Unexpected error with the request")
               }
               
           }
           
           task.resume()
       }
    
    func getHolidayListByHolidayType(){
        let url = URL(string:
                        "https://calendarific.com/api/v2/holidays?api_key=a90c5506798ec879722ab2118542a928955410fa&country=US&year=2019&type=national");
        
        
        print(url!)
           
        let request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        
        
        let task = APIHelper.session.dataTask(with: request){
            (data, response, error) -> Void in
            
            print("Starting data filtering")
            
            if let jsonData = data{
              do{
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
//                    guard
//                        let jsonDictionary = jsonObject as? [AnyHashable: Any],
//                        let results = jsonDictionary["holidays"] as? [[String:Any]] else{
//                        preconditionFailure("GUARD STATEMENT FAILED")
//                    }
                    //print(results[0])
                    
                    print(jsonObject)
                } catch let error {
                    print("Error creating json object: \(error)")
                }
            }else if let requestError = error{
                print("Error fetching data:\(requestError)")
            }
            else{
                print("Unexpected error with the request")
            }
            
        }
        
        task.resume()
        
    }
    
    
    
}
