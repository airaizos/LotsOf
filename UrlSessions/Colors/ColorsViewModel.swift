//
//  ColorsViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 18/9/22.
//

import Foundation
import UIKit

final class ColorsViewModel {
    var color: ColorModel?
    
    func build(with color: ColorModel) -> UIViewController {
        let viewController = ColorsViewController.create(with: color)
        return viewController
    }
}
