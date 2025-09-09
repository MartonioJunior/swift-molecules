//
//  MutableVariable+Tests.swift
//  Core
//
//  Created by Martônio Júnior on 12/08/2025.
//

@testable import SwiftMolecules
import Testing

struct MutableVariableTests {
    @Test("Returns internal value", arguments: [
        (MutableVariable(8), 8)
    ])
    func wrappedValue_get(sut: MutableVariable<Int>, expected: Int) {
        #expect(sut.wrappedValue == expected)
    }

    @Test("Defines new internal value", arguments: [
        (MutableVariable(9), 6)
    ])
    func wrappedValue_set(sut: MutableVariable<Int>, newValue: Int) {
        sut.wrappedValue = newValue
        #expect(sut.wrappedValue == newValue)
    }

    @Test("Returns the property's value", arguments: [
        (MutableVariable("Banana"), 6)
    ])
    func `subscript`(
        dynamicMemberGet sut: MutableVariable<String>,
        expected: Int
    ) {
        let result = sut[dynamicMember: \String.count]
        #expect(result == expected)
    }

    @Test("Returns the property's value", arguments: [
        (MutableVariable(19), 45)
    ])
    func `subscript`(
        dynamicMemberSet sut: MutableVariable<Int>,
        newValue: Int
    ) {
        sut[dynamicMember: \Int.self] = newValue
        let result = sut[dynamicMember: \Int.self]
        #expect(result == newValue)
    }
}
