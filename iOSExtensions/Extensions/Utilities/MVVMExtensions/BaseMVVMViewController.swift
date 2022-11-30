//
//  BaseMVVMViewController.swift
//  AegisRiderCommunityApp
//
//  Created by Abdul Suraj on 05/02/2022.
//

import Foundation
import UIKit
import RxSwift

class MVVMViewController: baseViewController {
    
    // MARK: - Constants
    let disposeBag = DisposeBag()
    
    // Label
    let lblTitle = UILabel()
    
    func addTitle() {
        lblTitle.sizeToFit()
        navigationItem.titleView = lblTitle
    }
}


class baseViewController: UIViewController {
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Observers
        // NotificationCenter.default.addObserver(self, selector: #selector(self.refreshData), name: .AppMode, object: nil)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        appDelegate.change(AppDefaults.shared.getAppMode())
    }
    
    @objc func refreshData() {
        print("refreshing...")
    }
    
    // MARK: - UI Status Bar Style
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.traitCollection.userInterfaceStyle == .dark ? .lightContent : .darkContent
    }
    
    func updateNavigation() {
        // Navigation Settings
        self.navigationController?.view.backgroundColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:  UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func updateLightNavigation() {
        // Navigation Settings
        self.navigationController?.view.backgroundColor =  .white
        self.navigationController?.navigationBar.tintColor =  .black
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if previousTraitCollection?.userInterfaceStyle == .dark {
            self.updateLightNavigation()
        } else {
            self.updateNavigation()
        }
    }
}
