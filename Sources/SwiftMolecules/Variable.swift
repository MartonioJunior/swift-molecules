//
//  Reference.swift
//
//
//  Created by Martônio Júnior on 11/10/23.
//

import Foundation

/// Container that encapsulates a value as a reference type
@dynamicMemberLookup
@propertyWrapper
public class Variable<Value> {
    // MARK: Variables
    internal var value: Value

    public var wrappedValue: Value { value }

    // MARK: Subscripts
    public subscript<T>(dynamicMember keyPath: KeyPath<Value, T>) -> T {
        value[keyPath: keyPath]
    }

    // MARK: Initializers
    required init(_ value: Value) {
        self.value = value
    }

    public convenience init(wrappedValue value: Value) {
        self.init(value)
    }

    deinit {}

    // MARK: Methods
    public func clone() -> Self { .init(value) }

    public func copyValue(to variable: Variable<Value>) {
        variable.value = self.value
    }

    public func map<T>(_ transform: (Value) -> T) -> T {
        transform(value)
    }
}

// MARK: Self: Sendable
extension Variable: @unchecked Sendable where Value: Sendable {}
