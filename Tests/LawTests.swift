//
//  LawTests.swift
//  LegalSystem
//
//  Created by horo on 3/18/25.
//

import XCTest
@testable import LegalSystem

final class LawTests: XCTestCase {
    func testLawHierarchy() {
        let constitution = Constitution(name: "中華民國憲法")
        let civilLaw = Law(name: "民法", level: .generalLaw)
        
        XCTAssertTrue(constitution.isSuperior(to: civilLaw))
        XCTAssertFalse(civilLaw.isSuperior(to: constitution))
    }
    
    func testArticleReferences() {
        let law = Law(name: "著作權法", level: .specialLaw)
        let article1 = LegalArticle(number: "1", text: "本法的目的", references: [], effectiveDate: nil)
        let article5 = LegalArticle(number: "5", text: "建築著作的定義", references: ["1"], effectiveDate: nil)
        law.addArticle(article1)
        law.addArticle(article5)

        XCTAssertTrue(law.validateReferences())
        
        let article58 = LegalArticle(number: "58", text: "違反規定者...", references: ["999"], effectiveDate: nil)
        law.addArticle(article58)
        
        XCTAssertFalse(law.validateReferences())  // 參考了不存在的條文
    }
    
    func testIsApplicable()  {
        let constitution = Law(name: "憲法", level: .constitution)
        let specialLaw = Law(name: "特別法", level: .specialLaw)
        let generalLaw = Law(name: "普通法", level: .generalLaw)
        
        XCTAssertTrue(specialLaw.isApplicable(over: generalLaw))
        XCTAssertFalse(generalLaw.isApplicable(over: specialLaw))
        XCTAssertTrue(constitution.isApplicable(over: generalLaw))
    }
}
