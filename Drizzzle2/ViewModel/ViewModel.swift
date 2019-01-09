//
//  ViewModel.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/25/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}
