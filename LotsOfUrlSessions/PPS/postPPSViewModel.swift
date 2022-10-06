//
//  postPPSViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 6/10/22.
//

import Foundation

final class postPPSViewModel {
    let provider = PostPPSProvider()
    
    var post = [PostPPS]()
    
    func getFetch() -> PostPPS {
        provider.getPosts()
    }
    
}
