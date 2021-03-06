//
//  ListCoordinator.swift
//  MVVMC
//
//  Created by Dennis Merli on 11/29/17.
//  Copyright © 2017 Dennis Merli. All rights reserved.
//

import Foundation
import UIKit

class ListCoordinator: BaseCoordinator {
    
    override func start(completion: @escaping (UIViewController?) -> ()) {
        let viewModel = ListViewModel()
        viewModel.coordinatorDelegate = self
        let vc : ListViewController = ListViewController(viewModel: viewModel , nibName: ListViewController.className, bundle: Bundle.main)
        self.navigationController?.viewControllers.append(vc)
        completion(self.navigationController)
    }
}

extension ListCoordinator : ListViewModelCoordinatorDelegate {
    func shouldMakeSegue(viewModel: Any?, sender: Any?) {
        let viewModel = DetailViewModel(vehicle: sender as? Vehicle)
        let detailCoordinator = DetailCoordinator(viewModel: viewModel)
        detailCoordinator.start { (viewController) in
            guard let viewController = viewController else {
                return
            }
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
