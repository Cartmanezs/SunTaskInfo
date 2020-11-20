//
//  DataFetcherService.swift
//  SunriseTask
//
//  Created by Ingvar on 19.11.2020.
//

import Foundation

class DataFetcherService {
    
    private var dataFetcher: DataFetcher
    private let baseURLString: String

    init(dataFetcher: DataFetcher = NetworkDataFetcher(), baseURLString: String) {
        self.baseURLString = baseURLString
        self.dataFetcher = dataFetcher
    }
    private func getFullUrl(longitude: Double,latitude: Double) -> String {
        return "\(baseURLString)/json?lat=\(longitude)&lng=\(latitude)&formatted=0"
    }

    func fetchSunStatus(longitude: Double,latitude: Double, completion: @escaping (SunInfoResponse?) -> Void) {
        let fullUrlString = getFullUrl(longitude: longitude, latitude: latitude)
        dataFetcher.fetchGenericJSONData(urlString: fullUrlString, response: completion)
    }
}
