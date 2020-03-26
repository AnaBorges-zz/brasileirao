//
//  DelegateLoginViewModel.swift
//  brasileiraoTests
//
//  Created by Ana Julia on 3/26/20.
//  Copyright © 2020 Ana Julia. All rights reserved.
//

import Foundation
@testable import brasileirao

class DelegateLoginMock: LoginViewModelDelegate{
    
    var _logar : (() -> Void)?
    func logar() {
        _logar?()
    }
}
