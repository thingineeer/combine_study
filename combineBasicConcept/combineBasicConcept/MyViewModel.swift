//
//  MyViewModel.swift
//  combineBasicConcept
//
//  Created by 이명진 on 1/30/24.
//

import Foundation
import Combine


class MyViewModel {
    
    // 구독 가능하게 설정
    
    @Published var passwordInput: String = ""
    @Published var passwordConfirm: String = ""
    
}
