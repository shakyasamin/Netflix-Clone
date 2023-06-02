//
//  Movie.swift
//  Netflix Clone
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 02/06/2023.
//

import Foundation

struct trendingMoviewResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path : String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double 
    
}


/*
 {
adult = 0;
"backdrop_path" = "/2I5eBh98Q4aPq8WdQrHdTC8ARhY.jpg";
"genre_ids" =             (
 28,
 12,
 16,
 878
);
id = 569094;
"media_type" = movie;
"original_language" = en;
"original_title" = "Spider-Man: Across the Spider-Verse";
overview = "After reuniting with Gwen Stacy, Brooklyn\U2019s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse\U2019s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.";
popularity = "1001.648";
"poster_path" = "/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg";
"release_date" = "2023-05-31";
title = "Spider-Man: Across the Spider-Verse";
video = 0;
"vote_average" = "8.637";
"vote_count" = 106;
}
 */
