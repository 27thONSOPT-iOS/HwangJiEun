//
//  GenericResponse.swift
//  6th_Seminar_27th
//
//  Created by 황지은 on 2020/11/21.
//

import Foundation

struct GenericResponse<T: Codable>: Codable {
    
    var status: Int
    var success: Bool
    var message: String
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
   // 데이터를 JSON 데이터 포맷으로 자유롭게 Decoding, Encoding 할 수 있도록 해주는 protocol
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
}
