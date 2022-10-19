//
//  PPSCollection.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 10/10/22.
//

import Foundation
import UIKit

struct FotoUUID: Hashable {
    let id = UUID()
    let image: UIImage
}


struct PPSCollection {
    let images: [URL] = [
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2022/10/Horas-dedicadas-al-mes.png")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2022/10/4160.pdf")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2022/08/42CC425D-39FE-4FE0-AEC9-AB6779E09D10.png")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2022/08/IMG_8440.jpg")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2022/08/Imagen.jpeg")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2022/08/IMG_0316-scaled.jpg")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2022/07/Imagen-scaled.jpeg")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2022/05/CV3.pdf")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2022/04/memoji.png")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2022/02/AdrianProyecto-1.mp4")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2022/02/AdrianProyecto.mp4")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2021/12/BlackJack.mp4")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2021/12/CV-Infojobs-v2.pdf")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2021/10/Observa-Las-Figuras.mp4")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2021/10/The-complete-software-developers-career-guide-1.png")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2021/10/cropped-IMG_8439.jpeg")!,
        .init(string:"https://www.proximaparadaswift.dev/wp-content/uploads/2021/09/IMG_8439-2.png")!,    
    ]
    
}
