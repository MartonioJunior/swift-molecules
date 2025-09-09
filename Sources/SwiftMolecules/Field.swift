//
//  Field.swift
//
//
//  Created by Martônio Júnior on 13/03/24.
//

import Foundation

/// Type that encapsulates a reference to a value
public enum Field<Value> {
    // MARK: Cases
    case constant(Value)
    case variable(Variable<Value>)

    // MARK: Variables
    public var value: Value {
        switch self {
            case .constant(let constant): constant
            case .variable(let variable): variable.wrappedValue
        }
    }
}

// MARK: Self: Sendable
extension Field: Sendable where Value: Sendable {}
