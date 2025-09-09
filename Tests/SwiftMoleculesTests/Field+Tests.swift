//
//  Field+Tests.swift
//  Core
//
//  Created by Martônio Júnior on 12/08/2025.
//

@testable import SwiftMolecules
import Testing

struct FieldTests {
    @Test("Returns value stored in field", arguments: [
        (Field.constant(5), 5),
        (Field.variable(.init(8)), 8)
    ])
    func value(sut: Field<Int>, expected: Int) {
        #expect(sut.value == expected)
    }
}
