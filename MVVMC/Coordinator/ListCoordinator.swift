//
//  ListCoordinator.swift
//  MVVMC
//
//  Created by Dennis Merli on 11/29/17.
//  Copyright © 2017 Dennis Merli. All rights reserved.
//

import Foundation
import UIKit

class ListCoordinator: BaseCoordinator<Void> {
    
    override func start(completion: @escaping (UIViewController?) -> ()) {
        let viewModel = ListViewModel()
        viewModel.coordinatorDelegate = self
        guard let vc = ListViewController(viewModel: viewModel , nibName: ListViewController.className, bundle: Bundle.main) as? ListViewController else {
            return
        }
        self.navigationController?.viewControllers.append(vc)
        completion(self.navigationController)
    }
}

extension ListCoordinator : ViewModelCoordinatorDelegate {
    func shouldMakeSegue(viewModel: Any?, sender: Any?) {
        let viewModel = DetailViewModel(vehicle: sender as! Vehicle)
        let vc = DetailViewController(viewModel: viewModel, nibName: DetailViewController.className, bundle: Bundle.main)
        self.navigationController?.pushViewController(vc, animated: true)
        print("should make segue")
    }
}
