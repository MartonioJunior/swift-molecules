//
//  Variable+Tests.swift
//  Core
//
//  Created by Martônio Júnior on 19/02/25.
//

@testable import SwiftMolecules
import Testing

struct VariableTests {
    @Test("Wraps a value type into a reference type", arguments: [
        (8, 8)
    ])
    func initializer(_ value: Int, expected: Int) {
        let sut = Variable(value)
        #expect(sut.wrappedValue == expected)
    }

    @Test("Wraps any value type as a reference", arguments: [
        (6, 6)
    ])
    func initializer(wrappedValue: Int, expected: Int) {
        @Variable var value = wrappedValue
        #expect(value == expected)
    }

    @Test("Returns internal value", arguments: [
        (Variable(8), 8)
    ])
    func wrappedValue(sut: Variable<Int>, expected: Int) {
        #expect(sut.wrappedValue == expected)
    }

    @Test("Returns the property's value", arguments: [
        (Variable("Apple"), 5)
    ])
    func `subscript`(
        dynamicMember sut: Variable<String>,
        expected: Int
    ) {
        let result = sut[dynamicMember: \String.count]
        #expect(result == expected)
    }

    @Test("Creates a copy of the variable as a new reference", arguments: [
        (Variable(17), 17)
    ])
    func clone(sut: Variable<Int>, expected: Int) {
        let clone = sut.clone()
        #expect(clone.wrappedValue == expected)
        #expect(sut.wrappedValue == clone.wrappedValue)
        #expect(clone !== sut)
    }

    @Test("Sets another variable with the same value", arguments: [
        (Variable(22), Variable(-5), 22)
    ])
    func copyValue(sut: Variable<Int>, target: Variable<Int>, expected: Int) {
        sut.copyValue(to: target)
        #expect(target.wrappedValue == expected)
    }

    @Test("Maps variable to a new value", arguments: [
        (Variable(6), 12)
    ])
    func map(sut: Variable<Int>, expected: Int) {
        let result = sut.map { $0 * 2 }
        #expect(result == expected)
    }
}
