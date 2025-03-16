//
//  Constitution.swift
//  LegalSystem
//
//  Created by horo on 3/16/25.
//

class Constitution: Law {
    init(name: String) {
        super.init(name: name, level: 1)  // 憲法層級最高
    }
}
