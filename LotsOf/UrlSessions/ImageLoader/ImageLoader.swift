//
//  ImageLoader.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 11/10/22.
// https://www.donnywals.com/efficiently-loading-images-in-table-views-and-collection-views/

import UIKit

final class ImageLoader {
    private var loadedImages = [URL: UIImage]()
    private var runningRequests = [UUID: URLSessionDataTask]()
    
    func loadImage(_ url: URL, _ completion: @escaping (Result<UIImage,Error>) ->Void) -> UUID? {
        //1 If the URL already exists as a key in our in-memory cache, we can immediately call the completion handler. Since there is no active task and nothing to cancel later, we can return nil instead of a UUID instance.
        if let image = loadedImages[url] {
            completion(.success(image))
            return nil
        }
        //2 to identify the data task that we’re about to create.
        let uuid = UUID()
        
        let task = URLSession.shared.dataTask(with: url) {  data, response, error in
        //3 When the data task completed, it should be removed from the running requests dictionary. We use a defer statement here to remove the running task before we leave the scope of the data task’s completion handler.
            defer { self.runningRequests.removeValue(forKey: uuid )}
            //4 When the data task completes and we can extract an image from the result of the data task, it is cached in the in-memory cache and the completion handler is called with the loaded image. After this, we can return from the data task’s completion handler.
            if let data = data, let image = UIImage(data: data) {
                self.loadedImages[url] = image
                completion(.success(image))
                return
            }
            //5
            guard let error = error else {
                // without an image or an error, we'll just ignore this for now. You could add your own special error cases for this scenario
                return
            }
            
            guard (error as NSError).code == NSURLErrorCancelled else { completion(.failure(error))
                return
            }
            // the request was cancelled, no need to call the callback
        }
        task.resume()
        //6 The data task is stored in the running requests dictionary using the UUID that was created in step 2. This UUID is then returned to the caller
        runningRequests[uuid] = task
        return uuid
    }
    
    func cancelLoad(_ uuid: UUID) {
        runningRequests[uuid]?.cancel()
        runningRequests.removeValue(forKey: uuid)
    }
    
}
