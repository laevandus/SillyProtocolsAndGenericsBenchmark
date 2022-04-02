//
//  BenchmarkProtocols.swift
//  ProtocolsAndGenericsBenchmark
//
//  Created by Toomas Vahter on 02.04.2022.
//

import Foundation

// MARK: - Protocols

protocol Computable {
    func compute() -> Int
}

struct DataProcessor: Computable {
    let a: Int, b: Int, c: Int, d: Int, e: Int
    
    init() {
        a = Int.random(in: 0..<10)
        b = Int.random(in: 0..<10)
        c = Int.random(in: 0..<10)
        d = Int.random(in: 0..<10)
        e = Int.random(in: 0..<10)
    }
    
    @inline(never)
    func compute() -> Int {
        return [a, b, c, d, e].reduce(0, +)
    }
}

struct ComputeCoreProtocols {
    @inline(never)
    var dataProcessors: [any Computable]
    
    @inline(never)
    func start() {
        var last = 0
        for p in dataProcessors {
            last = p.compute()
        }
        print(last)
    }
}

// MARK: - Generics

struct ComputeCoreGenerics<T: Computable> {
    @inline(never)
    var dataProcessors: [T]
    
    @inline(never)
    func start() {
        var last = 0
        for p in dataProcessors {
            last = p.compute()
        }
        print(last)
    }
}

struct Core {
    let dataProcessor: any Computable
}

struct Core2<T: Computable> {
    let dataProcessor: T
}
