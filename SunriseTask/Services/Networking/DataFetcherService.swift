//
//  DataFetcherService.swift
//  SunriseTask
//
//  Created by Ingvar on 19.11.2020.
//

import Foundation

class DataFetcherService {
    
    private var dataFetcher: DataFetcher
    private var baseURLString: String? 

    init(dataFetcher: DataFetcher = NetworkDataFetcher(), longitude: String, latitude: String) {
        self.baseURLString = "https://api.sunrise-sunset.org/json?lat=\(latitude)&lng=\(longitude)&formatted=0"
        self.dataFetcher = dataFetcher
    }
    
    
    func fetchSunStatus(completion: @escaping (SunInfoResponse?) -> Void) {
        guard let url = baseURLString else { completion(nil)
            return  }
        dataFetcher.fetchGenericJSONData(urlString: url, response: completion)
    }
}
