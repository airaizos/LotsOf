//
//  postPPSViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 6/10/22.
//

import Foundation

final class PostPPSViewModel {
    let provider = PostPPSProvider()
    
   
    
    func getFetch() {
        DispatchQueue.main.async {
            self.provider.getPosts()
        }
    }
}
