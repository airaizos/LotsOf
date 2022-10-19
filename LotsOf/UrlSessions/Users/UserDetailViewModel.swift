//
//  UserDetailViewModel.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 18/9/22.
//

import Foundation
import UIKit

final class UserDetailViewModel {
    var user: UserModel?
    
    func build(with user: UserModel) -> UIViewController {
        let viewController = UserDetailViewController()
        viewController.viewModel.user = user
        return viewController
    }
}
