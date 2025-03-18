//
//  LegalArticle.swift
//  LegalSystem
//
//  Created by horo on 3/17/25.
//

import Foundation

struct LegalArticle {
    let number: String
    let text: String
    let references: [String]  // 參考其他條文，例如 ["5", "58"]
    let effectiveDate: Date?
}
