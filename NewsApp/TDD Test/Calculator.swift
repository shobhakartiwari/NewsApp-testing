//
//  Calculator.swift
//  NewsApp
//
//  Created by Shobhakar Tiwari on 9/16/26.
//


/*
 Problem Statement: Design a calculator with
 1. sum
 2. sub
 3. mul
 4. div
 */

struct Calculator {
    func sum(n1: Int?, n2: Int?) -> Int {
        guard let n1, let n2 else { return 0 }
        return n1 + n2
    }
}
