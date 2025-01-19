//
//  APIResponse.swift
//  AlephTechnicalTest
//
//  Created by Dinda Ayu Syafitri on 19/01/25.
//

import Foundation

struct APIResponse<DataType: Codable, MetadataType: Codable>: Codable {
    let status: String
    let data: DataType
    let metadata: MetadataType
}
