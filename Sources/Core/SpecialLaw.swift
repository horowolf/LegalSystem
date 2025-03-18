//
//  SpecialLaw.swift
//  LegalSystem
//
//  Created by horo on 3/19/25.
//

class SpecialLaw: Law {
    let generalLaw: Law  // 指定適用的普通法

    init(name: String, generalLaw: Law) {
        self.generalLaw = generalLaw
        super.init(name: name, level: .specialLaw)
    }

    override func findArticle(byNumber number: String) -> LegalArticle? {
        return super.findArticle(byNumber: number) ?? generalLaw.findArticle(byNumber: number)
    }
}
