//
//  DataFetcherProtocol.swift
//  SunriseTask
//
//  Created by Ingvar on 19.11.2020.
//

import Foundation

protocol DataFetcher {
    func fetchGenericJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void)
}
