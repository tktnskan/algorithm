//
//  Car.swift
//  testProject
//
//  Created by GJC03280 on 2021/03/17.
//

import Foundation

public class Car {
    private final let name: String
    private var position: Int = 0
    private var canMove: Bool = false {
        didSet {
            if canMove {
                position += 1
            }
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    func moveCar() {
        let randomVal: Int = Int.random(in: 0..<9)
        canMove = false
        if randomVal >= 4 {
            canMove = true
        }
    }
    
    func getCarName() -> String {
        return name
    }
    
    func getCurrentPostion() -> Int {
        return position
    }
}
