//
//  RemoveViewController.swift
//  firts-app
//
//  Created by Matheus on 12/09/19.
//  Copyright © 2019 iCasei. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController{
    let controller:UIViewController
    init(controller:UIViewController){
        self.controller = controller
    }
    
    func show(_ meal:Meal, handler: @escaping (UIAlertAction) -> Void){
    let detail = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertController.Style.alert)
    
    let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
    detail.addAction(cancel)
    
    
    
    let remove = UIAlertAction(title: "Remove", style: UIAlertAction.Style.destructive, handler: handler)
    detail.addAction(remove)
    
    controller.present(detail, animated: true, completion: nil)

    
    print("Long press... \(meal.name) \n Items:\(meal.items)")
    
    }
    
    
    
}
