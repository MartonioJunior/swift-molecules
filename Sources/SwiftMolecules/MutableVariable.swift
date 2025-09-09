//
//  MutableVariable.swift
//  Trinkets
//
//  Created by Martônio Júnior on 09/09/2025.
//

@propertyWrapper
public class MutableVariable<Value>: Variable<Value> {
    override public var wrappedValue: Value {
        get { value }
        set { value = newValue }
    }

    subscript<T>(dynamicMember keyPath: WritableKeyPath<Value, T>) -> T {
        get { value[keyPath: keyPath] }
        set { value[keyPath: keyPath] = newValue }
    }
}

// MARK: Self: Sendable
extension MutableVariable: @unchecked Sendable where Value: Sendable {}
