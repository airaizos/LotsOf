//
//  PostPPS.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/10/22.
//

import UIKit

struct PostPPS: Identifiable, Codable{
    let id: Int
    
    struct Rendered: Codable {
        let rendered: String
    }
    let title: Rendered
    let excerpt: Rendered
    let jetpack_featured_media_url: URL
    let author:Int
}


struct Author: Identifiable, Codable {
    let id: Int
    let name: String
    
    struct AvatarURLs: Codable {
        let _96: URL
        
        enum CodingKeys: String, CodingKey {
            case _96 = "96"
        }
    }
    let avatar_urls: AvatarURLs
}


struct PostFetched {
    let title: String
    let excerpt: String
    let postImage: UIImage
    let author: String
    let authorImage: UIImage
}
