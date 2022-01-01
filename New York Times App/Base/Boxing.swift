//
//  Boxing.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
