//
//  MyResult.swift
//  SunriseTask
//
//  Created by Ingvar on 19.11.2020.
//

import Foundation

struct SunInfo: Codable {
    let sunrise: String
    let sunset: String
    let solar_noon: String
    let day_length: Int
    let civil_twilight_begin: String
    let civil_twilight_end: String
    let nautical_twilight_begin: String
    let nautical_twilight_end: String
    let astronomical_twilight_begin: String
    let astronomical_twilight_end: String
}

struct SunInfoResponse: Codable {
    let results: SunInfo
    let status: String
}
