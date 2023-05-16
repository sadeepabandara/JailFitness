//
//  APIFunctions.swift
//  JailFitness
//
//  Created by Sadeepa Bandara on 2023-04-02.
//

import Foundation
import Alamofire

struct Exercise: Decodable {
    var _id: String
    var image: String
    var title: String
}

class APIFunctions {
    var delegate: DataDelegate?
    static let functions = APIFunctions()
    
    func fetchExercises() {
        AF.request("http://localhost:8080/fetch").response { response in
            print(response.data)
            
            let data = String(data: response.data!, encoding: .utf8)
            
            self.delegate?.updateArray(newArray: data!)
        }
    }
    
    func addExercise(image: String, title: String) {
        AF.request("http://localhost:8080/create", method: .post, encoding: URLEncoding.httpBody, headers: ["image": image, "title": title]).responseJSON {
            response in
        }
    }
}
