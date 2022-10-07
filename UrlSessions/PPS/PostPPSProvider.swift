//
//  PostPPSProvider.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 3/10/22.
//

import UIKit
import Combine

final class PostPPSProvider {
    var postPPS: PostPPS?
    var post: PostFetched?
    var title: String?
    var excerpt: String?
    var postImage: UIImage?
    var author: String?
    var authorImage: UIImage?
    
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
    
    func getAuthorPublisher(author: Int) -> AnyPublisher<Author,Error> {
        URLSession.shared
            .dataTaskPublisher(for: urlAuthor.appendingPathComponent("\(author)"))
            .map(\.data)
            .decode(type: Author.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    //MARK: Publishers
    func getPosts() {
        let postPublisher = URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [PostPPS].self, decoder: JSONDecoder())
            .compactMap { $0.first }
             
            .share()
            .eraseToAnyPublisher()
        
        let imagePublisher = postPublisher
            .flatMap { post in
                self.getImagePublisher(url: post.jetpack_featured_media_url)
            }
        
        let authorPublisher = postPublisher
            .flatMap { post in
                self.getAuthorPublisher(author: post.author)
            }
        
        let  avatarPublisher = postPublisher
            .flatMap { post in
                self.getAuthorPublisher(author: post.author)
                    .flatMap { author in
                        self.getImagePublisher(url: author.avatar_urls._96)
                    }
            }
        
        Publishers.Zip4(postPublisher,imagePublisher,authorPublisher,avatarPublisher)
            .sink { completion in
                if case .failure(let error) = completion {
                    print("Algo ha ido mal: \(error)")
                }
                
            } receiveValue: { post, image, author, avatar in
                
                self.post = PostFetched(title: post.title.rendered, excerpt: post.excerpt.rendered, postImage: image, author: author.name, authorImage: avatar)
                
                print("Title: \(post.title.rendered)")
                print("Author: \(author.name)")
            }
            .store(in: &subscribers)
    }
}
