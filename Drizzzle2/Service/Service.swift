//
//  Service.swift
//  Drizzzle2
//
//  Created by 郭朋 on 11/25/18.
//  Copyright © 2018 Peng Guo. All rights reserved.
//

import UIKit

public enum Result<T> {
    case success(T)
    case failure(Error)
}

protocol Service {

}
