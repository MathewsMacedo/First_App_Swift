//
//  Alert.swift
//  firts-app
//
//  Created by Matheus on 09/09/19.
//  Copyright © 2019 iCasei. All rights reserved.
//

import Foundation
import UIKit

class Alert{
    
    let controller: UIViewController
    init(controller:UIViewController){
        
        self.controller = controller
        
    }
    
    
    func show(_ title:String = "Sorry", message:String = "Unexpected Error "){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Understood", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
}



