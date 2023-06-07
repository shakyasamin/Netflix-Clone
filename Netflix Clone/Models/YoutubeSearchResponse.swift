//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 07/06/2023.
//

import Foundation

//items =     (
//            {
//        etag = "7UboJMIrQupqmQDzXlM_1RJx7Zk";
//        id =             {
//            kind = "youtube#video";
//            videoId = "71xBu_VHTfY";
//        };
//        kind = "youtube#searchResult";
//    },

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
