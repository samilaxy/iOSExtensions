//
//  TableView+Extension.swift
//  Limou Cloud
//
//  Created by developer on 19/03/2021.
//

import Foundation
import UIKit

extension UITableView {
    
    func confirmDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.delegate = delegate
        self.dataSource = dataSource
        self.separatorStyle = .singleLine
        self.separatorColor = .clear
        self.tableFooterView = UIView(frame: .zero)
        self.backgroundColor = .clear
    }
    
    func register(_ identifier: String) {
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
  
}
