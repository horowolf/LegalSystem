//
//  Law.swift
//  LegalSystem
//
//  Created by horo on 3/16/25.
//

class Law {
    let name: String
    let level: Int  // 法律層級 (1: 憲法, 2: 法律, 3: 行政命令)
    
    init(name: String, level: Int) {
        self.name = name
        self.level = level
    }
    
    func isSuperior(to other: Law) -> Bool {
        return self.level < other.level
    }
}
