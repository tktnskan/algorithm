//
//  CarGame.swift
//  testProject
//
//  Created by GJC03280 on 2021/03/17.
//

import Foundation


enum InputValueError : Error {
    case outOfRange
    case invalidInput
}

class CarGame {
    
    func run() {
        guard let cars: [Car] = enterCarNames() else { return }
        guard var rounds: Int = enterRounds() else { return }
        
        while rounds > 0 {
            for car in cars {
                car.moveCar()
            }
            printCurrent(cars: cars)
            rounds -= 1
        }
        findWinner(cars: cars)
    }
    
    @discardableResult
    private func enterCarNames() -> [Car]? {
        print("경주할 자동차 이름을 입력하세요.(이름은 쉼표(,) 기준으로 구분) : ")
        let inputValues = readLine()
        var inputResult: [Car] = [Car]() // var를 쓸수밖에 없나????????????????
        
        do {
            inputResult = try self.settingCars(carNames: inputValues)
        } catch InputValueError.outOfRange {
            print("[ERROR] : 자동차 이름은 5글자를 넘길 수 없습니다.")
            enterCarNames()
        } catch InputValueError.invalidInput {
            print("[ERROR] : 자동차는 ','를 넣어 2개 이상 입력해주세요.")
            enterCarNames()
        } catch {
            print("[ERROR] : \(error).")
        }
        return inputResult
    }
    
    private func settingCars(carNames: String?) throws -> [Car] {
        guard let carNames: String = carNames, carNames.contains(",") else {
            throw InputValueError.invalidInput
        }
        
        let arrCarNames: [String] = carNames.components(separatedBy: ",")
        guard arrCarNames.filter({ name in
            if name.count > 5 {
                return true
            }
            return name.count == 0
        }).count == 0 else {
            throw InputValueError.outOfRange
        }
        
        var cars: [Car] = [Car]()
        for name in arrCarNames {
            cars.append(Car(name: name))
        }
        
        return cars
    }
    
    @discardableResult
    private func enterRounds() -> Int? {
        print("시도할 횟수는 몇회인가요? : ")
        let inputValues = readLine()
        var inputResult: Int = Int()
        do {
            inputResult = try self.settingRounds(rounds: inputValues)
        } catch InputValueError.invalidInput {
            print("[ERROR] : 숫자만 입력 가능합니다.")
            enterRounds()
        } catch {
            print("[ERROR] : \(error).")
        }
        
        return inputResult
    }
    
    private func settingRounds(rounds: String?) throws -> Int {
        guard let strRounds: String = rounds, strRounds.isInt, let rounds: Int = Int(strRounds) else {
            throw InputValueError.invalidInput
        }
        return rounds
    }
    
    private func printCurrent(cars: [Car]) {
        cars.forEach { (car) in
            print("\(car.getCarName()) : \(makeLine(car.getCurrentPostion()))")
        }
        print("\n")
    }

    private func makeLine(_ len: Int) -> String {
        var result: String = ""
        for _ in 0..<len {
            result += "-"
        }
        return result
    }

    private func findWinner(cars: [Car]) {
        let sortedCars = cars.sorted { (first, second) -> Bool in
            return first.getCurrentPostion() > second.getCurrentPostion()
        }
        let winnerPoint = sortedCars.first?.getCurrentPostion()
        var result: String = ""
        for car in sortedCars {
            if car.getCurrentPostion() == winnerPoint {
                result += "\(car.getCarName()), "
            }
        }
        result.removeLast()
        result.removeLast()
        print("최종 우승자: " + result)
    }
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}

