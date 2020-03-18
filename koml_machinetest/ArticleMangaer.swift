//
//  ArticleMangaer.swift
//  koml_machinetest
//
//  Created by Script Lanes on 09/03/20.
//  Copyright © 2020 Script Lanes. All rights reserved.
//

import Foundation
import Alamofire

class ArticleManager  {
   static let sharedInstance = ArticleManager()
    
    func fetchJsonData(completion:@escaping (Bool,[Articles]?) -> ()){
        AF.request(articleUrl).responseJSON { (response) in
            switch response.result{
            case .success(_):
                if response.result != nil{
                    let dataJson = response.data
                    do {
                        let base =  try JSONDecoder().decode(article_Base.self, from: dataJson!)
                        if base.status == "ok"{
                            if let articles = base.articles{
                                completion(true,articles)
                            }
                        }else{
                            completion(false,nil)
                        }
                    } catch {
                      print("Error: \(error)")
                    }
                }
                break
            case .failure(_):
                print("failure")
            
        }
        
        }
    }
    
    
    func fetchNewJsonData(completion:@escaping (Bool,[Articles]?) -> ()){
        AF.request(articleUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil).response{ (respinse) in
            if let error = respinse.error {
                print("Error making an API call. - \(error.localizedDescription)")
                completion(false, nil)
                return
            }
            if let data = respinse.data{
                do {
                    print("sucess in json call")
                    let model = try JSONDecoder().decode(article_Base.self, from: data)
                    let array = model.articles
                    completion(true,array)
                    
                } catch let err {
                    print("error is :\(err.localizedDescription)")
                    completion(false,nil)
                }
            }
        }
    }
    
    func fetchHeroJson(completion:@escaping (Bool,[Hero_Base?]) -> ()) {
        AF.request(heroUrl, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil).response { (response) in
            if let data = response.data{
                do {
                    print("success in hero Api")
                    let decoder = JSONDecoder()
                   let throwables = try decoder.decode([Throwable<Hero_Base>].self, from: data)
                    var value = throwables.map{$0.value}
                    print("value is :\(value)")
                    completion(true,value)
                    
                } catch let err {
                    print("into catch :\(err.localizedDescription)")
                }
            }
        }
    }
    
}







enum Throwable<T: Decodable>: Decodable {
    case success(T)
    case failure(Error)

    init(from decoder: Decoder) throws {
        do {
            let decoded = try T(from: decoder)
            self = .success(decoded)
        } catch let error {
            self = .failure(error)
        }
    }
}

extension Throwable {
    var value: T? {
        switch self {
        case .failure(_):
            return nil
        case .success(let value):
            return value
        }
    }
}
