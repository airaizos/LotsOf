//
//  PostPPSProvider.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/10/22.
//

import Foundation
import Combine


final class PostPPSProvider {
    var subscribers = Set<AnyCancellable>()
    let urlAppleCoding = "applecoding.com"
    let pps = "proximaparadaswift.dev"
    
    let url = URL(string: "https://applecoding.com/wp-json/wp/v2/posts")!
    
    let urlAuthor = URL(string: "https://applecoding.com/wp-json/wp/v2/users")!
    
    func getImagePublisher(url: URL) -> AnyPublisher<UIImage,Error> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .compactMap { UIImage(data: $0) }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
