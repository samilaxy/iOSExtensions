//
//  BaseMVVMViewModel.swift
//  AegisRider-iOS
//
//  Created by Abdul Suraj on 11/01/2022.
//

import Foundation
import RxSwift
import RxCocoa

// Inherit this class for all view models
class BaseMVVMViewModel: ObservableObject {
    
    // MARK: - Private Constants
    let bag = DisposeBag()
    
    // MARK: - Variables
    private let error = BehaviorRelay<Bool>(value: false)
    let errorMessage = BehaviorRelay<String?>(value: nil)
    let type = BehaviorRelay<SuccessType>(value: .none)
    let statusCode = BehaviorRelay<StatusCodes>(value: .none)
    
    // MARK: - Model Function
    var hasError: Bool {
        return error.value
    }
    
    var message: Driver<String?> {
        return errorMessage.asDriver()
    }
    
    func setError(_ message: String) {
        self.error.accept(true)
        self.errorMessage.accept(message)
    }
    
    func setMessage(_ message: String) {
        self.error.accept(true)
        self.errorMessage.accept(message)
    }
    
    func getError() -> String {
        return errorMessage.value ?? ""
    }
    
    // RX
    var isRequestLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var isSuccess: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var isFailure: BehaviorRelay<Bool> = BehaviorRelay(value: false)
}
