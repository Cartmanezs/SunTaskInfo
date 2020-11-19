//
//  NetworkingProtocol.swift
//  SunriseTask
//
//  Created by Ingvar on 19.11.2020.
//

import Foundation

protocol Networking {
    func request(urlString: String, completion: @escaping (Data?, ErrorType?) -> Void)
}
