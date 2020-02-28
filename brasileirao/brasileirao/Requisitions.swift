//
//  Requisitions.swift
//  brasileirao
//
//  Created by Ana Julia on 1/28/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation

/*enum geralError {
    case url
    case taskError (error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

class Requisitions {
    private static let basePath = "https://private-62ae5-brasileirao8.apiary-mock.com/"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type" : "application/json"]
        return config
    }()
    
    private static let session = URLSession(configuration:configuration)
    
    
//    class func loadJogos(rodada: Int, onComplete: @escaping ([JogoModel]) -> Void,  onError: @escaping (geralError) -> Void){
//        guard let url = URL(string: basePath + "jogos/" + String(rodada)) else {
//            onError(.url)
//            return
//        }
//        
//        var request = URLRequest(url:url)
//        request.httpMethod = "GET"
//        request.setValue(UserDefaults.standard.string(forKey: "token"), forHTTPHeaderField: "token")
//
//        let dataTask = session.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
//            
//            if error == nil {
//                
//                guard let response = response as? HTTPURLResponse else {
//                    onError(.noResponse)
//                    return
//                }
//                
//                if response.statusCode == 200{
//                    
//                    guard let data = data else {return}
//                    do{
//                        let jogos = try JSONDecoder().decode([JogoModel].self, from: data)
//                        onComplete(jogos)
//                        
//                    } catch {
//                        print(">>>>>> \(error)")
//                        onError(.invalidJSON)
//                    }
//                }
//                else{
//                    onError(.responseStatusCode(code: response.statusCode))
//                }
//                
//            } else {
//                onError(.taskError(error: error!))
//            }
//            
//        }
//        dataTask.resume()
//    }
//    
    
//    class func loginAutentication(user: String, password:String){
//        let login = Login(login: user, password: password)
//
//        guard let url = URL(string: basePath + "login") else {
//            print("deu ruim")
//            return
//        }
//
//        var request = URLRequest(url:url)
//        request.httpMethod = "POST"
//
//        do{
//            request.httpBody = try JSONEncoder().encode(login)
//        } catch let error{
//            print("erro \(error)")
//            return
//        }
//
//        let dataTask = session.dataTask(with: request) { (data, response, error) in
//            if error == nil{
//                guard let response = response as? HTTPURLResponse else{
//                    print("não funfou")
//                    return
//                }
//
//                if response.statusCode == 200 {
//                    guard let data = data else{
//                        return
//                    }
//
//                    do{
//                        let token = try JSONDecoder().decode([LoginResponse].self, from: data)
//
//                        UserDefaults.standard.setValue(token.first?.token, forKey: "token")
//
//                    } catch {
//                        print(">>>>>> \(error)")
//                    }
//
//                }
//                else {
//                    print(response.statusCode)
//                }
//            }
//        }
//        dataTask.resume()
    
    class func loadLanceLance(idJogo: Int, onComplete: @escaping ([LanceALanceModel]) -> Void,  onError: @escaping (geralError) -> Void){
        guard let url = URL(string: basePath + "lances/" + String(idJogo)) else {
            onError(.url)
            return
        }
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        request.setValue(UserDefaults.standard.string(forKey: "token"), forHTTPHeaderField: "token")

        let dataTask = session.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                
                if response.statusCode == 200{
                    
                    guard let data = data else {return}
                    do{
                        let lances = try JSONDecoder().decode([LanceALanceModel].self, from: data)
                        onComplete(lances)

                    } catch {
                        print(">>>>>> \(error)")
                        onError(.invalidJSON)
                    }
                }
                else{
                    onError(.responseStatusCode(code: response.statusCode))
                }
                
            } else {
                onError(.taskError(error: error!))
            }
            
        }
        dataTask.resume()
    }
}*/

