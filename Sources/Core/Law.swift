//
//  Law.swift
//  LegalSystem
//
//  Created by horo on 3/16/25.
//

enum LawLevel: Int, Comparable {
    case constitution = 1
    case specialLaw = 2
    case generalLaw = 3
    case administrativeOrder = 4

    static func < (lhs: LawLevel, rhs: LawLevel) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

class Law {
    let name: String
    let level: LawLevel  // 法律層級 (1: 憲法, 2: 法律, 3: 行政命令)
    var articles: [LegalArticle] = []
    enum DefinedTerms {}  // 讓子類別自行擴展名詞定義
    
    init(name: String, level: LawLevel) {
        self.name = name
        self.level = level
    }
    
    func isSuperior(to other: Law) -> Bool {
        return self.level < other.level
    }

    func addArticle(_ article: LegalArticle) {
        articles.append(article)
    }

    func findArticle(byNumber number: String) -> LegalArticle? {
        return articles.first { $0.number == number }
    }
    
    func validateReferences() -> Bool {
        for article in articles {
            for reference in article.references {
                if findArticle(byNumber: reference) == nil {
                    return false  // 參考的條文不存在
                }
            }
        }
        return true
    }
    
    func isApplicable(over other: Law) -> Bool {
        if self.isSuperior(to: other) {
            return true  // 高層級法律優先
        }
        if self.level == other.level {
            return false  // 同層級法律通常不會相互覆蓋
        }
        return false
    }
}
