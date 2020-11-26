//
//  NetworkResult.swift
//  6th_Assignment_27th
//
//  Created by 황지은 on 2020/11/26.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
