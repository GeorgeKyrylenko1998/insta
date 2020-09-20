//
//  InstagramApi.swift
//  Instagramm app
//
//  Created by George Kyrylenko on 20.09.2020.
//  Copyright © 2020 TestApp. All rights reserved.
//

import Foundation
import Promises

struct InstagramAPI{
    func getUserBio(username: String) -> Promise<InstagramBio> {
        return Promise<InstagramBio>(on: .main){(fullfill, reject) in
            guard let url = URL(string: "https://www.instagram.com/\(username)/?__a=1") else {
                reject(NSError(domain: "app.error", code: 0, userInfo: nil))
                return
            }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    reject(error!)
                    return
                }
                guard let data = data else {
                    reject(NSError(domain: "app.error", code: 1, userInfo: nil))
                    return
                }
                do{
                    let userBio = try JSONDecoder().decode(InstagramBio.self, from: data)
                    fullfill(userBio)
                }catch{
                    reject(error)
                }
            }.resume()
        }
    }
}
