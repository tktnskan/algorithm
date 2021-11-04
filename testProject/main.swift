//
//  main.swift
//  testProject
//
//  Created by GJC03280 on 2021/03/17.
//

import Foundation


//let game = CarGame()
//
//game.run()
//game.findWinner()

//
//func solution(_ n:Int, _ costs:[[Int]]) -> Int {
//
//
//    func getParent(parent: inout [Int], index: Int) -> Int {
//        if parent[index] == index {
//            return index
//        } else {
//            parent[index] = getParent(parent: &parent, index: parent[index])
//            return parent[index]
//        }
//    }
//
//    func unionParent(parent: inout [Int], a: Int, b: Int) {
//        let num1 = getParent(parent: &parent, index: a)
//        let num2 = getParent(parent: &parent, index: b)
//        if num1 > num2 {
//            parent[num2] = parent[num1]
//        } else {
//            parent[num1] = parent[num2]
//        }
//    }
//
//    var result: Int = 0
//    var parentNodeTable: [Int] = []
//    var lines: Int = 0
//
//    let costs = costs.sorted { (first, second) -> Bool in
//        return first[2] < second[2]
//    }
//
//    for i in 0..<n {
//        parentNodeTable.append(i)
//    }
//
//    for i in 0..<costs.count {
//        if lines == n - 1 {
//            break
//        }
//
//        if getParent(parent: &parentNodeTable, index: costs[i][0]) != getParent(parent: &parentNodeTable, index: costs[i][1]) {
//            result += costs[i][2]
//            lines += 1
//
//            unionParent(parent: &parentNodeTable, a: costs[i][0], b: costs[i][1])
//        }
//    }
//    return result
//}
//
//// [0,1,1]
//// [1,3,1]
//// [0,2,2]
//// [1,2,5]
//// [2,3,8]
//print(solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]))


//let a = [3,2,4,3,6,1,2]
//let b = a.sorted(by: <)
//print(b)



//let a = 6
//let b = [[1,1,10], [2,5,6], [3,13,15], [4,14,17], [5,8,14], [6,3,12]]
//
//func aaa(a:Int, b:[[Int]]) {
//    let c = b.sorted{ (first, second) in
//        if (first[2] == second[2]) {
//            return first[1] < second[1]
//        } else {
//            return first[2] < second[2]
//        }
//    }
//
//    var end = 0
//    var answer: [Int] = []
//    for i in c {
//        if end <= i[1] {
//            end = i[2]
//            answer.append(i[0])
//        }
//    }
//}
//
//aaa(a: a, b: b)
//
//var result = 99999999
//
//func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
//    if !words.contains(target) {
//        return 0
//    }
//    let visited = Array(repeating: false, count: words.count)
//    result = 99999999
//
//    dfs(begin: begin, target: target, words: words, visited: visited, answer: 0)
//
//    return result
//}
//func dfs(begin: String, target:String, words:[String], visited: [Bool], answer: Int) {
//    if begin == target {
//        if answer < result {
//            result = answer
//        }
//        return
//    }
//
//    var visited = visited
//    var ans = answer
//    for idx in 0..<words.count {
//        var diff = 0
//        var cnt1 = 0
//
//        for str in words[idx] {
//            var cnt2 = 0
//            for str2 in begin {
//                if cnt1 == cnt2, str2 != str {
//                    diff += 1
//                }
//                cnt2 += 1
//            }
//            cnt1 += 1
//        }
//        if diff == 1 && visited[idx] == false {
//            visited[idx] = true
//            ans += 1
//            dfs(begin: words[idx], target: target, words: words, visited: visited, answer: ans)
//            visited[idx] = false
//            ans -= 1
//        }
//    }
//}
//
//print(solution("1234567000", "1234567899", [
//                "1234567800", "1234567890", "1234567899"]))


//func solution(_ operations:[String]) -> [Int] {
//
//    var queue:[Int] = []
//
//    for operation in operations {
//        let listOp = operation.split(separator: " ")
//        if listOp[0] == "D" {
//            if queue.count == 0 {
//                continue
//            }
//
//            if listOp[1] == "1" {
//                queue = queue.sorted()
//                queue.removeLast()
//            } else if listOp[1] == "-1" {
//                queue = queue.sorted()
//                queue.removeFirst()
//            }
//        } else if listOp[0] == "I" {
//            queue.append(Int(listOp[1])!)
//        }
//    }
//    if queue.count == 0 {
//        return [0, 0]
//    } else {
//        return [queue.max()!, queue.min()!]
//    }
//}
//
//print(solution(["I 16","D 1"]))

//
//
//func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
//    var lock = lock
//    let initLockCount = lock.count
//    let key1:[[Int]] = key
//    let key2:[[Int]] = lotation(data: key1)
//    let key3:[[Int]] = lotation(data: key2)
//    let key4:[[Int]] = lotation(data: key3)
//    var answer = false
//
//    let diff = key.count - 1
//    for _ in 0..<diff {
//        for idx in 0..<lock.count {
//            lock[idx].append(0)
//            lock[idx].insert(0, at: 0)
//        }
//    }
//    for _ in 0..<diff {
//        lock.insert(Array(repeating: 0, count: initLockCount + 2 * diff), at: 0)
//        lock.append(Array(repeating: 0, count: initLockCount + 2 * diff))
//    }
//
//    for lockX in 0..<lock.count-diff {
//        for lockY in 0..<lock.count-diff {
//            if check(lock: lock, lockX: lockX, lockY: lockY, key1: key1, key2: key2, key3: key3, key4: key4) {
//                answer = true
//                break
//            }
//        }
//        if answer {
//            break
//        }
//    }
//
//    return answer
//}
//
//func check(lock: [[Int]], lockX: Int, lockY: Int, key1: [[Int]], key2: [[Int]], key3: [[Int]], key4: [[Int]]) -> Bool {
//    var returnVal = true
//    var hihi = true
//    for key in [key1, key2, key3, key4] {
//        var copyLock = lock
//        hihi = true
//        returnVal = true
//        for keyX in 0..<key.count {
//            for keyY in 0..<key.count {
//                if key[keyX][keyY] != 1 {
//                    continue
//                }
//                if copyLock[lockX+keyX][lockY+keyY] == 0 {
//                    copyLock[lockX+keyX][lockY+keyY] = 1
//                } else {
//                    returnVal = false
//                }
//            }
//        }
//        if returnVal {
//            for x in key.count-1...copyLock.count-key.count {
//                for y in key.count-1...copyLock.count-key.count {
//                    if copyLock[x][y] == 0 {
//                        hihi = false
//                    }
//                }
//            }
//        } else {
//            hihi = false
//        }
//
//        if hihi {
////            for co in copyLock {
////                print(co)
////            }
//            break
//        }
//    }
//    return hihi
//}
//
//func lotation(data: [[Int]]) -> [[Int]] {
//    let n = data.count
//    var data = data
//    for layer in 0..<n / 2 {
//        let first:Int = layer
//        let last:Int = n - 1 - first
//        for i in first..<last {
//
//            let offset:Int = i - first
//            let top:Int = data[first][i]
//
//            data[first][i] = data[last - offset][first]
//
//            data[last - offset][first] = data[last][last - offset]
//
//            data[last][last - offset] = data[i][last]
//
//            data[i][last] = top
//        }
//    }
//    return data
//}
//
//print(solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]]))

//var checkVisit: Set<[Bool]> = []
//func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
//    checkVisit = Set()
//    var users: [[String]] = []
//    for idx in 0..<user_id.count {
//        users.append([])
//        for i in user_id[idx] {
//            users[idx].append(String(i))
//        }
//    }
//    var bans: [[String]] = []
//    for idx in 0..<banned_id.count {
//        bans.append([])
//        for i in banned_id[idx] {
//            bans[idx].append(String(i))
//        }
//    }
//    var new_users: [[String]] = []
//    for user in users {
//        for ban in bans {
//            if user.count != ban.count {
//                continue
//            }
//            var check = true
//            for idx in 0..<user.count {
//                if ban[idx] != "*" {
//                    if ban[idx] != user[idx] {
//                        check = false
//                        break
//                    }
//                }
//            }
//            if check {
//                if !new_users.contains(user) {
//                    new_users.append(user)
//                }
//            }
//        }
//    }
//
//
//    let visited: [Bool] = Array(repeating: false, count: new_users.count)
//    dfs(users: new_users, bans: bans, visited: visited)
//
//    return checkVisit.count
//}
//
//func dfs(users: [[String]], bans: [[String]], visited: [Bool]) {
//    var bans = bans
//    var visited = visited
//    if bans.count == 0 {
//        checkVisit.insert(visited)
//        return
//    }
//    var cnt = 0
//    for idxBan in 0..<bans.count {
//        let banId = bans[idxBan-cnt]
//        for userIdx in 0..<users.count {
//            let userId = users[userIdx]
//            if banId.count != userId.count || visited[userIdx] {
//                continue
//            }
//
//            var check = true
//            for idx in 0..<userId.count {
//                if banId[idx] != "*" {
//                    if banId[idx] != userId[idx] {
//                        check = false
//                        break
//                    }
//                }
//            }
//
//            if check {
//                bans.remove(at: idxBan-cnt)
//                cnt += 1
//                visited[userIdx] = true
//                dfs(users: users, bans: bans, visited: visited)
//                cnt -= 1
//                bans.insert(banId, at: idxBan-cnt)
//                visited[userIdx] = false
//            }
//        }
//    }
//}
//
//print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"]))

//func solution(_ a:[Int], _ b:[Int]) -> Int {
//    var arr:[[Int]] = []
//    for i in 0..<a.count {
//        arr.append([a[i], b[i]])
//    }
//    return arr.reduce(0) { (reuslt, hi) -> Int in
//        return reuslt + hi[0] * hi[1]
//    }
//}
//
//solution([1,2,3,4], [1,2,3,4])

//let b = [1,2,3,4,5,6,7,8,9,10].reduce([0, 0]) { (result, hi) -> [Int] in
//    if hi % 2 == 0 {
//        return [result[0], result[1] + hi]
//    } else {
//        return [result[0] + hi, result[1]]
//    }
//}

//var dict:[[String]:Int] = [:]
//func solution(_ orders:[String], _ course:[Int]) -> [String] {
//    var reorders: [[String]] = []
//    dict = [:]
//    for idx in 0..<orders.count {
//        reorders.append([])
//        for i in orders[idx] {
//            reorders[idx].append(String(i))
//        }
//    }
//
//    for order in reorders {
//        for courseNum in course {
//            if order.count >= courseNum {
//                dfs(order: order, targetNum: courseNum, result: [], startIdx: 0)
//            }
//        }
//    }
////    print(dict)
//    var maxValDict: [String:Int] = [:]
//    for cour in course {
//        maxValDict["\(cour)"] = 0
//    }
//    let sortedDict = dict.sorted { (first, second) -> Bool in
//        if maxValDict["\(first.key.count)"] ?? 0 < first.value {
//            maxValDict["\(first.key.count)"] = first.value
//        }
//        if first.key.count == first.key.count {
//            return first.value > second.value
//        }
//        return first.key.count > first.key.count
//    }
//    var answer: [String] = []
//
//    for (key, val) in sortedDict {
//        if (val >= 2) {
//            if maxValDict["\(key.count)"] == val {
//                var str = ""
//                for a in key {
//                    str += a
//                }
//                answer.append(str)
//            }
//        }
//    }
////    print(answer)
//    return answer.sorted()
//}
//
//func dfs(order: [String], targetNum: Int, result: [String], startIdx: Int) {
//    if result.count == targetNum {
////        print(dict)
//        let result = result.sorted()
////        print(result)
//        if dict[result] != nil {
//            dict[result]! += 1
//        } else {
//            dict[result] = 1
//        }
//        return
//    }
//    for i in startIdx..<order.count {
////        print(result, [order[i]], startIdx)
//        dfs(order: order, targetNum: targetNum, result: result + [order[i]], startIdx: i+1)
//    }
//}
//
//solution(["XYZ", "XWY", "WXA"], [2,3,4])


//func solution(_ board:[[Int]]) -> Int
//{
//    var answer:Int = 1
//    var board = board
//    var hi = 0
//    for i in board {
//        hi += i.reduce(0, +)
//    }
//    if hi == 0 {
//        return 0
//    }
//    for i in 1..<board.count {
//        for j in 1..<board[0].count {
//            let diagoanl = board[i-1][j-1]
//            let left = board[i][j-1]
//            let top = board[i-1][j]
//            let minVal = min(diagoanl, left, top)
//            if minVal >= 1 && board[i][j] != 0 {
//                board[i][j] = minVal + 1
//                if board[i][j] > answer {
//                    answer = board[i][j]
//                }
//            }
//        }
//    }
//    return answer * answer
//}
//
//print(solution([[0,0,1,1],[1,1,1,1]]))

//func solution(_ gems:[String]) -> [Int] {
//    var startNum = 0
//    var endNum = gems.count
//    var left = 0
//    var right = -1
//    let gemsSetCount = Set(gems).count
//    var gemsDic:[String:Int] = [:]
//    var count = 0
//
//    while left < gems.count && right < gems.count {
//        count = gemsDic.count
//        if count == gemsSetCount {
//
//            if (endNum - startNum) > (right - left) {
//                startNum = left
//                endNum = right
//            }
//
//            if left == right {
//                break
//            }
//
//            if let value = gemsDic[gems[left]] {
//                if (value - 1) == 0 {
//                    gemsDic.removeValue(forKey: gems[left])
//                }
//                else {
//                    gemsDic[gems[left]] = value - 1
//                }
//            }
//            left += 1
//        }
//        else {
//            right += 1
//            if right < gems.count {
//                if let value = gemsDic[gems[right]]{
//                    gemsDic[gems[right]] = value + 1
//                }
//                else {
//                    gemsDic[gems[right]] = 1
//                }
//            }
//        }
//    }
//    return [startNum+1, endNum+1]
//}
//
//print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))

// n = 셔틀 운행 횟수.   t = 셔틀 운행 간격. m 은 한번에 탈수 있는 수
//func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
//    var sortedTimeTable = timetable.sorted()
//    var answer = ""
//    var busTime = "09:00"
//
//    for i in 0..<n {
//        var cnt = 0
//        var mm = m
//
//        if i == n-1 {
//            if sortedTimeTable.count < mm {
//                answer = busTime
//            } else {
//                if min(busTime, sortedTimeTable[mm-1]) == sortedTimeTable[mm-1] {
//                    var userBusTime = sortedTimeTable[mm-1]
//                    let busHourMin = userBusTime.split(separator: ":")
//                    var busHour = Int(busHourMin[0])!
//                    var busMin = Int(busHourMin[1])!
//                    if busMin == 0 {
//                        busMin = 59
//                        busHour -= 1
//                    } else {
//                        busMin -= 1
//                    }
//                    if String(busMin).count == 1 && String(busHour).count == 1 {
//                        userBusTime = "0\(busHour):0\(busMin)"
//                    } else if String(busMin).count == 1 {
//                        userBusTime = "\(busHour):0\(busMin)"
//                    } else if (String(busHour).count == 1) {
//                        userBusTime = "0\(busHour):\(busMin)"
//                    } else {
//                        userBusTime = "\(busHour):\(busMin)"
//                    }
//                    answer = userBusTime
//                } else {
//                    var userBusTime = busTime
//                    let busHourMin = userBusTime.split(separator: ":")
//                    var busHour = Int(busHourMin[0])!
//                    var busMin = Int(busHourMin[1])!
//                    if busMin >= 60 {
//                        busMin -= 60
//                        busHour += 1
//                    }
//                    if String(busMin).count == 1 && String(busHour).count == 1 {
//                        userBusTime = "0\(busHour):0\(busMin)"
//                    } else if String(busMin).count == 1 {
//                        userBusTime = "\(busHour):0\(busMin)"
//                    } else if (String(busHour).count == 1) {
//                        userBusTime = "0\(busHour):\(busMin)"
//                    } else {
//                        userBusTime = "\(busHour):\(busMin)"
//                    }
//                    answer = busTime
//                }
//            }
//            break
//        }
//
//        for idx in 0..<sortedTimeTable.count {
//            if min(busTime, sortedTimeTable[idx-cnt]) == sortedTimeTable[idx-cnt] {
//                sortedTimeTable.remove(at: idx-cnt)
//                cnt += 1
//                mm -= 1
//            }
//            if mm == 0 {
//                break
//            }
//        }
//
//        let busHourMin = busTime.split(separator: ":")
//        var busHour = Int(busHourMin[0])!
//        var busMin = Int(busHourMin[1])!
//        busMin += t
//        if busMin >= 60 {
//            busMin -= 60
//            busHour += 1
//        }
//        if String(busMin).count == 1 && String(busHour).count == 1 {
//            busTime = "0\(busHour):0\(busMin)"
//        } else if String(busMin).count == 1 {
//            busTime = "\(busHour):0\(busMin)"
//        } else if (String(busHour).count == 1) {
//            busTime = "0\(busHour):\(busMin)"
//        } else {
//            busTime = "\(busHour):\(busMin)"
//        }
//    }
//    return answer
//}
//
//print(solution(1, 1, 1, ["23:59"]))



//func solution(_ lines:[String]) -> Int {
//    return 0
//}

//
//func solution(_ lines:[String]) -> Int {
//    for line in lines {
//        let listLine = line.split(separator: " ")
//        let endTime = listLine[1]
//        let consumeTime = listLine[2]
//
//    }
//    return 0
//}
//print(Float("0.321")!)
//print(solution([
//    "2016-09-15 20:59:57.421 0.351s",
//    "2016-09-15 20:59:58.233 1.181s",
//    "2016-09-15 20:59:58.299 0.8s",
//    "2016-09-15 20:59:58.688 1.041s",
//    "2016-09-15 20:59:59.591 1.412s",
//    "2016-09-15 21:00:00.464 1.466s",
//    "2016-09-15 21:00:00.741 1.581s",
//    "2016-09-15 21:00:00.748 2.31s",
//    "2016-09-15 21:00:00.966 0.381s",
//    "2016-09-15 21:00:02.066 2.62s"
//    ]))

//class FoodInfo {
//    let idx: Int
//    let left: Int
//    init(idx: Int, left: Int) {
//        self.idx = idx
//        self.left = left
//    }
//}
//
//func solution(_ food_times:[Int], _ k:Int64) -> Int {
//    if food_times.reduce(0, +) * food_times.count < k {
//        return -1
//    }
//
//    var foodLists: [FoodInfo] = []
//    for idx in 0..<food_times.count {
//        foodLists.append(FoodInfo(idx: idx, left: food_times[idx]))
//    }
//
//    foodLists = foodLists.sorted { (first, second) -> Bool in
//        return first.left < second.left
//    }
//
//    var totalEat = 0
//    var foodMin = foodLists[0].left + totalEat
//    var foodLen = foodMin * foodLists.count
//    var k = k
//    print(foodLists)
//    while k >= foodLen {
//        var cnt = 0
//        totalEat += foodMin
//        k -= Int64(foodLen)
//        for idx in 0..<foodLists.count {
//            if foodLists[idx-cnt].left == totalEat {
//                foodLists.remove(at: idx-cnt)
//                print(foodLists)
//                cnt += 1
//            } else {
//                break
//            }
//        }
//        if foodLists.count == 0 {
//            return -1
//        }
//        foodMin = foodLists[0].left - totalEat
//        foodLen = foodMin * foodLists.count
//    }
//
//    if k == 0 {
//        return foodLists[0].left + 1
//    }
//
//    var answer = 0
//    foodLen = foodLists.count
//    while k >= foodLen {
//        var cnt = 0
//        totalEat += 1
//        k -= Int64(foodLen)
//        for idx in 0..<foodLists.count {
//            if foodLists[idx-cnt].left - totalEat == 0 {
//                foodLists.remove(at: idx-cnt)
//                print(foodLists)
//                cnt += 1
//            } else {
//                break
//            }
//        }
//        if foodLists.count == 0 {
//            return -1
//        }
//        foodLen = foodLists.count
//    }
//
//    if k == 0 {
//        return foodLists[0].left + 1
//    }
//
//    for i in 1...k {
//        var cnt = 0
//        for idx in 0..<foodLists.count {
//            if foodLists[idx-cnt].left - totalEat - Int(i) == 0 {
//                foodLists.remove(at: idx-cnt)
//                print(foodLists)
//                cnt += 1
//            } else {
//                break
//            }
//        }
//        if foodLists.count == 0 {
//            return -1
//        }
//    }
//
//    return foodLists[0].idx + 1
//}
//
//print(solution([3, 1, 2], 5))


//func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
//    var building: [[Int]] = []
//    for build in build_frame {
//        if build[2] == 0 {
//            // 기둥
//            if build[3] == 0 {
//                // 삭제
//                var check = true
//                for i in building {
//                    if i[3] == 0 {
//                        continue
//                    }
//                    if i[0] == build[0] && i[2] == 0 {
//                        check = false
//                    }
//                }
//
//                if check {
//                    building.append(build)
//                }
//            } else{
//                // 설치
//                var check = false
//                for i in building {
//                    if i[3] == 0 {
//                        continue
//                    }
//                    if i[2] == 0 {
//                        if i[0] == build[0] && i[1] + 1 == build[1] {
//                            check = true
//                        }
//                    } else if i[2] == 1 {
//                        if i[0] + 1 == build[0] && i[1] == build[1] {
//                            check = true
//                        }
//                    }
//                }
//
//                if check || building.count == 0 {
//                    building.append(build)
//                }
//            }
//        } else {
//            // 보
//            if build[3] == 0 {
//                // 삭제
//                var check = true
//                for i in building {
//                    if i[3] == 0 {
//                        continue
//                    }
//                    if i[2] == 0 {
//                        if build[0] - 1 == i[0] && build[1] == i[1] {
//                            check = false
//                        }
//                    }
//                }
//
//                if check {
//                    building.append(build)
//                }
//            } else {
//                // 설치
//                var check = false
//                for i in building {
//                    if i[3] == 0 {
//                        continue
//                    }
//                    if i[2] == 1 {
//                        if build == [4,2,1,1] {
//                            print(building)
//                        }
//                        if i[0] + 1 == build[0] && i[1] == build[1] {
//                            check = true
//                        }
//                        if i[0] - 1 == build[0] && i[1] == build[1] {
//                            check = true
//                        }
//                    } else if i[2] == 0 {
//                        if i[0] == build[0] && build[1] == i[1] + 1 {
//                            check = true
//                        }
//                    }
//                }
//                if check || building.count == 0 {
//                    building.append(build)
//                }
//            }
//        }
//    }
//    return building
//}
//
//print(solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]]))






//let 삭제 = 0
//let 설치 = 1
//let 기둥 = 0
//let 보 = 1
//
//func isAvailable(building:Set<[Int]>) -> Bool {
//    for build in building {
//        if build[2] == 기둥 {
//            //기둥
//            if build[1] != 0 &&
//                !building.contains([build[0], build[1]-1, 기둥]) &&
//                !building.contains([build[0]-1, build[1], 보]) &&
//                !building.contains([build[0], build[1], 보]) {
//                return true
//            }
//        } else {
//            //보
//            if !building.contains([build[0], build[1]-1, 기둥]) && !building.contains([build[0]+1, build[1]-1, 기둥]) && !(building.contains([build[0]-1, build[1], 보]) && building.contains([build[0]+1, build[1], 보])) {
//                return true
//            }
//        }
//    }
//    return false
//}
//
//func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
//    var building:Set<[Int]> = []
//
//    for build in build_frame {
//        let 삭제설치 = build[3]
//        if 삭제설치 == 설치 {
//            building.insert([build[0],build[1],build[2]])
//            if isAvailable(building: building) {
//                building.remove([build[0],build[1],build[2]])
//            }
//        } else if building.contains([build[0],build[1],build[2]]) {
//            building.remove([build[0],build[1],build[2]])
//            if isAvailable(building: building) {
//                building.insert([build[0],build[1],build[2]])
//            }
//        }
//    }
//    let firstSorted = building.sorted(by: { (first, second) -> Bool in
//        if first[0] != second[0] {
//            return first[0] < second[0]
//        } else {
//            if first[1] != second[1] {
//                return first[1] < second[1]
//            } else {
//                return first[2] < second[2]
//            }
//        }
//    })
//    return firstSorted
//}
//
//print(solution(5, [[0,0,0,1],[2,0,0,1],[4,0,0,1],[0,1,1,1],[1,1,1,1],[2,1,1,1],[3,1,1,1],[2,0,0,0],[1,1,1,0],[2,2,0,1]]))


//var answer = 0
//var computerssss: [[Int]] = []
//func solution(_ n:Int, _ computers:[[Int]]) -> Int {
//    answer = 0
//    computerssss = computers
//    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
//    for i in 0..<computerssss.count {
//        for j in 0..<computerssss[0].count {
//            var queue: [[Int]] = []
//            if computerssss[i][j] == 1 && !visited[i][j] {
//                answer += 1
//                queue.append([i,j])
//            }
//
//            while queue.count != 0 {
//                guard let hi = queue.popLast() else { break }
//                visited[hi[0]][hi[1]] = true
//                for d in 0..<computerssss[hi[1]].count {
//                    if computerssss[hi[1]][d] == 1 && !visited[hi[1]][d] {
//                        queue.append([hi[1], d])
//                    }
//                }
//            }
//        }
//    }
//    return answer
//}

//1 1 0
//1 1 0
//0 0 1



//print(solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]]))

//
//func solution(_ n:Int, _ times:[Int]) -> Int64 {
//    let times = times.sorted()
//    var l = 1
//    var r = times[0] * n
//    var answer = 0
//    while l <= r {
//        let mid = (r + l) / 2
//        var tempN = n
//        for i in times {
//            tempN -= mid / i
//
//            if tempN <= 0 {
//                answer = mid
//                r = mid - 1
//                break
//            }
//        }
//        if tempN > 0 {
//            l = mid + 1
//        }
//    }
//    return Int64(answer)
//}
//
//print(solution(6, [7, 10]))
//11 / 7
////[3, 3, 4, 7, 10]
////[0, 0 , 4, 7 , 10]
////[0, 3, 10]




//var rooms:[Int64:Int64] = [:]
//func solution(_ k:Int64, _ room_number:[Int64]) -> [Int64] {
//    var answer:[Int64] = []
//    rooms = [:]
//    for room in room_number {
//        answer.append(dfs(room: room))
//    }
//    return answer
//}
//
//func dfs(room: Int64) -> Int64 {
//    if rooms[room] == nil {
//        rooms[room] = room + 1
//        return room
//    }
//    let findRoom = dfs(room: rooms[room]!)
//    rooms[room] = findRoom + 1
//    return findRoom
//}
//
//print(solution(10, [1,3,4,1,3,1]))

//
//func solution(_ words:[String], _ queries:[String]) -> [Int] {
//
//    return []
//}
//
//print(solution(["frodo", "front", "frost", "frozen", "frame", "kakao"], ["fro??", "????o", "fr???", "fro???", "pro?"]))


//var count: Int = 0
//var num: Int = 0
//func solution(_ n:Int) -> Int {
//    num = n
//    
//    dfsBackTracking(check: Array(repeating: 0, count: num), arrQueen: [], n: 0)
//    return count
//}
//
//func dfsBackTracking(check: [Int], arrQueen: [[Int]], n: Int) {
//    var check = check
//    
//    if num == n {
//        count += 1
//        return
//    }
//    for i in 0..<num {
//        if check[i] == 0 {
//            var found = false
//            for queen in arrQueen {
//                if abs(n - queen[0]) == abs(i - queen[1]) {
//                    found = true
//                    break
//                }
//            }
//            if !found {
//                check[i] = 1
//                dfsBackTracking(check: check, arrQueen: arrQueen + [[n, i]], n: n + 1)
//                check[i] = 0
//            }
//        }
//    }
//}
//
//print(solution(4))
//let a = Array(repeating: <#T##_#>, count: <#T##Int#>)

//func solution(_ info:[String], _ query:[String]) -> [Int] {
//    var answer: [Int] = []
//    var dict: [String: [Int]] = [:]
//    for singleInfo in info {
//        let hi = singleInfo.split(separator: " ")
//        var str = ""
//        for idx in 0..<hi.count-1 {
//            str += hi[idx]
//        }
//
//        guard var dictVal = dict[str] else {
//            let num = hi[hi.count-1]
//            dict[str] = [Int(num)!]
//            continue
//        }
//        dictVal.append(Int(hi[hi.count-1])!)
//        dict[str] = dictVal
//    }
//
//    for singleQuery in query {
//        let hi = singleQuery.split(separator: " ")
//        var str = ""
//        for idx in 0..<hi.count-1 {
//            if hi[idx] != "and" {
//                str += hi[idx]
//            }
//        }
//
//        guard let dictVal = dict[str] else {
//            answer.append(0)
//            continue
//        }
//        var cnt = 0
//        for val in dictVal {
//            if val >= Int(hi[hi.count-1])! {
//                cnt += 1
//            }
//        }
//        answer.append(cnt)
//    }
//    print(dict)
//    return answer
//}
//
//
//print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))

//
//func solution(_ a:[Int], _ b:[Int]) -> Int {
//    let sortedA = a.sorted()
//    var sortedB = b.sorted()
//    var cnt = 0
//    var hihi = 0
//    for aa in sortedA {
//        var idx = 0
//        if hihi >= sortedB.count {
//            break
//        }
//
//        for i in hihi..<sortedB.count {
//            if sortedB[i] > aa {
//                hihi = i
//                break
//            }
//            idx += 1
//        }
//        if idx >= sortedB.count {
//            break
//        }
//        sortedB.remove(at: idx)
//        cnt += 1
//    }
//
//    return cnt
//}
//
//print(solution([5,1,3,7], [2,2,6,8]))
//print(solution([2,2,2,2], [1,1,1,1]))



//
//func solution(_ jobs:[[Int]]) -> Int {
//    let jobsCount = jobs.count
//    var answer = 0
//    var jobs = jobs.sorted { (first, second) -> Bool in
//        if first[0] == second[0] {
//            return first[1] < second[1]
//        }
//        return first[0] < second[0]
//    }
////    print(jobs)
//    var cnt = 0
//
//    while jobs.count > 0 {
//        let a = jobs.removeFirst()
////        print("a", a)
////        print("cnt", cnt)
//        if cnt < a[0] {
//            answer += (a[1]-a[0])
//            cnt = a[1]
////            print("answer11111", answer)
////            print("cnt1111", cnt)
//        } else {
//            answer += (cnt + (a[1]-a[0]))
//            cnt += a[1]
////            print("answer222222", answer)
////            print("cnt222222", cnt)
//        }
//
//        let jobsSort = jobs.sorted { (first, second) -> Bool in
//            if first[0] < cnt && second[0] < cnt {
//                return first[0] + first[1] < second[0] + second[1]
//            } else {
//                return false
//            }
//        }
////        print("jobsSort", jobsSort)
////        print("-------")
//        jobs = jobsSort
//    }
//
//    return answer / jobsCount
//}
//
////print(solution([[0, 3], [1, 9], [2, 6], [12, 16], [100, 400]]))
////print(solution([[24, 10], [28, 39], [43, 20], [37, 5], [47, 22], [20, 47], [15, 2], [15, 34], [35, 43], [26, 1]])) // 72
////print(solution([[1, 9], [1, 4], [1, 5], [1, 7], [1, 3]])) // 13
//print(solution([[0, 3], [1, 9], [2, 6]]))




//final class DeallocHooker {
//    typealias Handler = () -> Void
//    private struct AssociatedKey {
//        static var deallocHooker = "deallocHooker"
//    }
//
//    private let handler: Handler
//    private init(_ handler: @escaping Handler) {
//        self.handler = handler
//    }
//
//    deinit {
//        handler()
//    }
//
//    static func install(to object: AnyObject, _ handler: @escaping Handler) {
//        objc_setAssociatedObject(
//            object,
//            &AssociatedKey.deallocHooker,
//            DeallocHooker(handler),
//            .OBJC_ASSOCIATION_RETAIN_NONATOMIC
//        )
//    }
//}
//
//
//func safeString(string: NSMutableString) -> NSMutableString {
//    let encoding = String.Encoding.utf8.rawValue
//
//    // 문자열이 특정 인코딩일때 최대 크기를 반환 (내용이 잘리는 이슈 방지)
//    let bufferSize = string.maximumLengthOfBytes(using: encoding) + 1
//    // UnsafeMutablePointer를 버퍼 사이즈 만큼 allocate()  -> 직접 heap에서 메모리 할당 가능
//    let buffer = UnsafeMutablePointer<Int8>.allocate(capacity: bufferSize)
//    // 할당받은 공간의 인코딩된 문자열을 가져옴. ( 문자열 마지막엔 null이 들어가므로 -1 )
//    string.getCString(buffer, maxLength: bufferSize-1, encoding: encoding)
//
//    // bytesNoCopy 생성자를 사용하면 buffer를 복사하지 않고, 그 값을 그대로 사용 가능
//    // strlen은 null 문자 전까지 길이를 반환해줌
//    // freeWhenDone = NSMutableString이 해제될 때, 자동으로 buffer를 메모리에서 해제하는지 여부
//    let newString = NSMutableString(bytesNoCopy: buffer, length: strlen(buffer), encoding: encoding, freeWhenDone: false) ?? NSMutableString()
//
//    // 해제되는 시점에 버퍼를 비워주고, 메모리에서 해제
//    DeallocHooker.install(to: newString) {
//        memset(buffer, 0, bufferSize)
//        buffer.deallocate()
//    }
//
//    return newString
//}

//protocol InfoRule {
//
//    var name : String {get}
//    var id : Int {get set}
//    var totalID : Int {get set}
//
//    mutating func changeInfo(name : String)
//
//    func returnInfo() -> String
//}
//
//struct StudentInfo : InfoRule {
//
//    var name : String = {
//        return "HururuekChapChap"
//    }()
//
//    var id: Int
//
//    var totalID: Int{
//        get{
//            return 100+self.id
//        }
//        set{
//            self.id = newValue
//        }
//    }
//
//    mutating func changeInfo(name: String) {
//        self.name = name
//    }
//
//    func returnInfo() -> String{
//        return "\(name) : \(id)"
//    }
//
//}
//
//let su = StudentInfo(name: "aaa", id: 0)
//print(su.name)

//func solution(_ stones:[Int], _ k:Int) -> Int {
//    var answer = 0
//    var l = 1
//    guard var r = stones.max() else { return answer }
//    while l <= r {
//        var stonessss = stones
//        let mid = (r + l) / 2
//        var dis = 0
//        var cnt = 0
//        var check = false
//        for idx in 0..<stonessss.count {
//            stonessss[idx] -= mid
//            if stonessss[idx] <= 0 {
//                cnt += 1
//                check = true
//            } else {
//                check = false
//            }
//            if !check || idx == stonessss.count - 1 {
//                if cnt >= dis {
//                    dis = cnt
//                }
//                cnt = 0
//            }
//            if dis >= k {
//                r = mid - 1
//                break
//            }
//        }
//        if dis < k {
//            if answer < mid {
//                answer = mid
//            }
//            l = mid + 1
//        }
//    }
//    return answer + 1
//}
//
//
//print(solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3))


//func solution(_ s:String) -> Int{
//    var stack: [Character] = []
//    for a in s {
//        if stack.isEmpty || stack.last ?? nil != a {
//            stack.append(a)
//        } else {
//            stack.popLast()
//        }
//    }
//
//    return stack.isEmpty ? 1 : 0
//}
//
//print(solution("baabaa"))


//
//func solution(_ str1:String, _ str2:String) -> Int {
//    let str1 = str1.lowercased()
//    let str2 = str2.lowercased()
//
//    var arrStr1: [Character] = []
//    var arrStr2: [Character] = []
//    for i in str1 {
//        arrStr1.append(i)
//    }
//
//    for i in str2 {
//        arrStr2.append(i)
//    }
//
//    var com1: Set<String> = []
//    var com2: Set<String> = []
//    var dictCom1: [String:Int] = [:]
//    var dictCom2: [String:Int] = [:]
//
//    for idx in 0..<arrStr1.count-1{
//        let a = arrStr1[idx]
//        let b = arrStr1[idx+1]
//        if (a.isLetter && b.isLetter) {
//            com1.insert("\(a)\(b)")
//            if dictCom1["\(a)\(b)"] == nil {
//                dictCom1["\(a)\(b)"] = 1
//            } else {
//                dictCom1["\(a)\(b)"]! += 1
//            }
//        }
//    }
//
//    for idx in 0..<arrStr2.count-1{
//        let a = arrStr2[idx]
//        let b = arrStr2[idx+1]
//        if (a.isLetter && b.isLetter) {
//            com2.insert("\(a)\(b)")
//            if dictCom2["\(a)\(b)"] == nil {
//                dictCom2["\(a)\(b)"] = 1
//            } else {
//                dictCom2["\(a)\(b)"]! += 1
//            }
//        }
//    }
//
//    var union = Array(com1.union(com2))
//    var diff = Array(com1.intersection(com2))
//    for ele in union {
//        if com1.contains(ele) && com2.contains(ele) {
//            guard let a = dictCom1[ele] else { break }
//            guard let b = dictCom2[ele] else { break }
//            let maxVal = max(a, b)
//            for _ in 0..<maxVal-1 {
//                union.append(ele)
//            }
//        } else if com1.contains(ele) {
//            guard let a = dictCom1[ele] else { break }
//            for _ in 0..<a-1 {
//                union.append(ele)
//            }
//
//        } else if com2.contains(ele) {
//            guard let b = dictCom2[ele] else { break }
//            for _ in 0..<b-1 {
//                union.append(ele)
//            }
//        }
//    }
//
//    for ele in diff {
//        if com1.contains(ele) && com2.contains(ele) {
//            guard let a = dictCom1[ele] else { break }
//            guard let b = dictCom2[ele] else { break }
//            let maxVal = min(a, b)
//            for _ in 0..<maxVal-1 {
//                diff.append(ele)
//            }
//        } else if com1.contains(ele) {
//            guard let a = dictCom1[ele] else { break }
//            for _ in 0..<a-1 {
//                diff.append(ele)
//            }
//
//        } else if com2.contains(ele) {
//            guard let b = dictCom2[ele] else { break }
//            for _ in 0..<b-1 {
//                diff.append(ele)
//            }
//        }
//    }
//
//    if union.count == 0 && diff.count == 0 {
//        return 65536
//    }
//    let per = Float(diff.count) / Float(union.count)
//
//    let answer = Int(per * 65536)
//
//    return answer
//}
//
//
//
//print(solution("FRANCE", "french"))
//print(solution("handshake", "shake hands"))
//print(solution("aa1+aa2", "AAAA12"))
//print(solution("E=M*C^2", "e=m*c^2"))


// estimate = 200,000
// k = 100,000        10000000000
//func solution(_ estimates:[Int], _ k: Int) -> Int {
//    var answer = 0
//    var arrAnswer: [Int] = []
//    for i in 0..<k {
//        answer += estimates[i]
//        arrAnswer.append(estimates[i])
//    }
//    var poAnswer = answer
//    for idx in k..<estimates.count {
//        var potAnswer = poAnswer
//        potAnswer -= arrAnswer.removeFirst()
//        potAnswer += estimates[idx]
//        arrAnswer.append(estimates[idx])
//        if potAnswer > answer {
//            answer = potAnswer
//        }
//        poAnswer = potAnswer
//    }
//
//    return answer
//}
//
////print(solution([5,1,9,8,10,5], 3)) // 27
//print(solution([10,1,10,1,1,4,3,10], 6))  //29


//func solution(_ location:[[Int]], _ s:[Int], _ e:[Int]) -> Int {
//    var answer = 0
//    let minX = min(s[0], e[0])
//    let maxX = max(s[0], e[0])
//    let minY = min(s[1], e[1])
//    let maxY = max(s[1], e[1])
//    for lo in location {
//        if lo[0] <= maxX && lo[0] >= minX && lo[1] >= minY && lo[1] <= maxY {
//            answer += 1
//        }
//    }
//
//    return answer
//}
//
//
//print(solution([[0,3],[1,1],[1,5],[2,2],[3,3],[4,0]], [1,4], [4,1])) // 3
//print(solution([[0,3],[1,1],[1,5],[2,2],[3,3],[4,0]], [3,4], [0,0]))


//func solution(_ card: [String], _ word: [String]) -> [String] {
//    var answer: [String] = []
//
//    var dictTotal: [Character:Int] = [:]
//    var dictFirst: [Character:Int] = [:]
//    var dictSecond: [Character:Int] = [:]
//    var dictThird: [Character:Int] = [:]
//
//    var cnt = 0
//    for cardRow in card {
//        for singleCard in cardRow {
//            if dictTotal[singleCard] == nil {
//                dictTotal[singleCard] = 1
//            } else {
//                dictTotal[singleCard]! += 1
//            }
//            if cnt == 0 {
//                if dictFirst[singleCard] == nil {
//                    dictFirst[singleCard] = 1
//                } else {
//                    dictFirst[singleCard]! += 1
//                }
//            } else if cnt == 1 {
//                if dictSecond[singleCard] == nil {
//                    dictSecond[singleCard] = 1
//                } else {
//                    dictSecond[singleCard]! += 1
//                }
//            } else if cnt == 2 {
//                if dictThird[singleCard] == nil {
//                    dictThird[singleCard] = 1
//                } else {
//                    dictThird[singleCard]! += 1
//                }
//            }
//        }
//        cnt += 1
//    }
//    print(dictTotal)
//    print(dictFirst)
//    print(dictSecond)
//    print(dictThird)
//    var check = false
//    for singleWord in word {
//        print("singleWord", singleWord)
//        check = false
//        var check2 = false
//        var check3 = false
//        var check4 = false
//        for char in singleWord {
//            let fil = singleWord.filter{ $0 == char }
//            if dictTotal[char] == nil {
//                check = true
//                break
//            } else {
//                if fil.count > dictTotal[char]! {
//                    check = true
//                    break
//                }
//            }
//            print("char", char)
//            if dictFirst[char] != nil {
//                check2 = true
//            }
//            if dictSecond[char] != nil {
//                check3 = true
//            }
//            if dictThird[char] != nil {
//                check4 = true
//            }
//        }
//        if !check && check2 && check3 && check4 {
//            answer.append(singleWord)
//        }
//    }
//    if answer.count == 0 {
//        answer.append("-1")
//    }
//    return answer
//}
//
//print(solution(["ABACDEFG", "NOPQRSTU","HIJKLKMM"], ["GPQM", "GPMZ", "EFU", "MMNA"]))
//// ["GPQM", "MMNA"]
//print(solution(["AABBCCDD", "KKKKJJJJ", "MOMOMOMO"], ["AAAKKKKKMMMMM", "ABCDKJ"]))


//func solution(_ new_id:String) -> String {
//    let new_id = new_id.lowercased()
//    var arrNew: [String] = []
//    for i in new_id {
//        if i.isLetter || i.isNumber || String(i) == "-" || String(i) == "_" || String(i) == "." {
//            arrNew.append(String(i))
//        }
//    }
//    var new: String = arrNew.joined(separator: "")
//    while new.contains("..") {
//        new = new.replacingOccurrences(of: "..", with: ".")
//    }
//    if new.last == "." {
//        while new.last == "." {
//            new.removeLast()
//        }
//    }
//    if new.first == "." {
//        while new.first == "." {
//            new.removeFirst()
//        }
//    }
//    if new.count == 0 {
//        new = "a"
//    }
//    if new.count >= 16 {
//        while new.count > 15 {
//            new.removeLast()
//        }
//        if new.last == "." {
//            new.removeLast()
//        }
//    }
//
//    if new.count <= 2 {
//        var lastWord = ""
//        var cnt = 0
//        for i in new {
//            if cnt == new.count - 1{
//                lastWord = String(i)
//            }
//            cnt += 1
//        }
//        while new.count < 3 {
//            new += lastWord
//        }
//    }
//
//    return new
//}
//
//print(solution("...!@BaT#*..y.abcdefghijklm"))
//print(solution("z-+.^."))
//print(solution("=.="))
//print(solution("123_.def"))
//print(solution("abcdefghijklmn.p"))

//func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
//    return 123456789
//}
//
//print(solution([4,7,12], [true, false, true]))


//
//func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
//    var answer: [Int] = []
//    for command in commands {
//        var hi: [Int] = []
//        for idx in command[0]-1..<command[1] {
//            hi.append(array[idx])
//        }
//        var sortedHi = hi.sorted(by: <)
//        answer.append(sortedHi[command[2]-1])
//    }
//    return answer
//}

//func solution(_ n:Int, _ words:[String]) -> [Int] {
//    var cnt = 0
//    var words = words
//    var saveWords: [String : Bool] = [:]
//    var lastWord: String = words.removeFirst()
//    if (saveWords[lastWord] == nil) {
//        saveWords[lastWord] = true
//    }
//    var answer: [Int] = [0,0]
//    print(words)
//    for word in words {
//        cnt += 1
//        if word.first != lastWord.last {
//            answer = [cnt%n+1, cnt/n+1]
//            break
//        }
//        if (saveWords[word] == nil) {
//            saveWords[word] = true
//            lastWord = word
//        } else {
//            answer = [cnt%n+1, cnt/n+1]
//            break
//        }
//    }
//    return answer
//}
//
//print(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))

//var completionHandlers = [() -> Void]()
//func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) { completionHandlers.append(completionHandler)
//
//}
//func someFunctionWithNonescapingClosure(closure: () -> Void) {
//    closure()
//}
//
//
//class SomeOtherClass {
//    var x = 10
//    func doSomething() {
//        someFunctionWithEscapingClosure { [self] in
//            x = 100
//        }
//        someFunctionWithNonescapingClosure {
//            x = 200
//        }
//    }
//}



//var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//let customerProvider = { customersInLine.remove(at: 0) }
//
////func serve(customer customerProvider: () -> String) {
////    print("Now serving \(customerProvider())!")
////}
//func serve(customer customerProvider: @autoclosure () -> String) {
//    print("Now serving \(customerProvider())!")
//}
//
//serve(customer: customersInLine.remove(at: 0))
//
//
//enum Beverage: CaseIterable {
//    case coffee, tea, juice
//}
//
//let numberOfChoices = Beverage.allCases.count
//
//enum Barcode {
//    case upc(Int, Int)
//    case qrCode(String)
//}
//
//var productBarcode = Barcode.upc(0,1)
//productBarcode = .qrCode("asjdjdjd")
//
//switch productBarcode {
//case .upc(let a, let b):
//    print(a,b)
//case .qrCode(let code):
//    print(code)
//}
//
//
//struct Point {
//    var x = 0.0, y = 0.0
//}
//struct Size {
//    var width = 0.0, height = 0.0
//}
//struct Rect {
//    var origin = Point()
//    var size = Size()
//    var center: Point {
//        get {
//            let centerX = origin.x + (size.width / 2)
//            let centerY = origin.y + (size.height / 2)
//            return Point(x: centerX, y: centerY)
//        }
//        set(newCenter) {
//            origin.x = newCenter.x - (size.width / 2)
//            origin.y = newCenter.y - (size.height / 2) }
//    }
//}
//var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
//let initialSquareCenter = square.center
//square.center = Point(x: 12.0, y: 12.0)
//print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
//print(square.center)


//@propertyWrapper
//struct TwelveOrLess {
//    private var number: Int
//    init() {
//        self.number = 0
//    }
//    var wrappedValue: Int {
//        get {
//            return number
//        }
//        set {
//            number = min(newValue, 12)
//        }
//    }
//}
//
//struct SmallRect {
//    @TwelveOrLess var height: Int
//    @TwelveOrLess var width: Int
//}
//
//var rect = SmallRect()
//rect.height = 24
//print(rect.height)
//
//struct SmallRectangle {
//    private var _height = TwelveOrLess()
//    private var _width = TwelveOrLess()
//
//    var height: Int {
//        get {
//            return _height.wrappedValue
//        }
//        set {
//            _height.wrappedValue = newValue
//        }
//    }
//    var width: Int {
//        get {
//            return _width.wrappedValue
//        }
//        set {
//            _width.wrappedValue = newValue
//        }
//    }
//}
//
//
//@propertyWrapper
//struct SmallNumber {
//    private var maximum: Int
//    private var number: Int
//
//    var wrappedValue: Int {
//        get {
//            return number
//        }
//        set {
//            number = min(newValue, maximum)
//        }
//    }
//
//    init() {
//        maximum = 12
//        number = 0
//    }
//
//    init(wrappedValue: Int) {
//        maximum = 12
//        number = min(wrappedValue, maximum)
//    }
//
//    init(wrappedValue: Int, maximum: Int) {
//        self.maximum = maximum
//        number = min(wrappedValue, maximum)
//    }
//}
//
//struct ZeroRectangle {
//    @SmallNumber var height: Int = 2
//    @SmallNumber var width: Int
//}
//
//var zeroRectangle = ZeroRectangle()
//print(zeroRectangle.height, zeroRectangle.width)

//enum BarCodeType: String {
//    case upc
//    case code16k
//    case flat
//    case qr(String)
//}


//protocol SomeTossProtocol {
//    static var four: Self { get }
//}
//
//enum SomeEnumType: Int, SomeTossProtocol {
//    case one
//    case two = 2
//    case three = 3
//    case four
//}
////
//enum SomeEnumComparableType: Comparable {
//    case one
//    case two
//    case three
//    case four
//}
//print(SomeEnumComparableType.four > SomeEnumComparableType.three)
//
//
//enum School: String {
//    case primary = "유치원"
//    case elementary = "초등학교"
//    case middle = "중학교"
//    case high = "고등학교"
//    case college
//    case university
//    case graduate
//}
//
//let highestEducationLevel: School =  School.university
//print("저의 최종학력은 \(highestEducationLevel.rawValue) 졸업입니다.")
//
//// 연관 값을 갖는 열거형
//enum MainDish {
//    case pasta(taste: String)
//    case pizza(dough: String, topping: String)
//    case chicken(withSauce: Bool)
//    case rice
//}
//
//var dinner: MainDish = MainDish.pasta(taste: "크림")     // 크림 파스타
//dinner = .pizza(dough: "치즈크러스트", topping: "불고기")    // 불고기 치즈크러스트 피자
//dinner = .chicken(withSauce: true)  // 양념 통닭
//dinner = .rice  // 밥


//let names = ["Junseok", "Songyi", "Kim", "Karl"]
//let numbers = [1, 2, 3, 4]
//
//let result1 = names.map { $0.lowercased() }
//let result2 = names.filter { $0.count < 5 }
//let result3 = numbers.reduce(0) { $0 + $1 }
//let result4 = names.filter { $0.contains("K") }.map { $0.count }
//print(result1)
//print(result2)
//print(result3)
//print(result4)
//
//class Human {
//    var name = "Unknown"
//    var alias: String {
//        get {
//            return name + " 바보"
//        }
//        set {
//            name = newValue + "별명에서 붙여진 이름"
//        }
//    }
//}
//
//class Sodeul: Human {
//
//    override var alias: String {
//        willSet {
//            print("현재 alias = \(alias), 바뀔 alias = \(newValue)")
//        }
//        didSet {
//            print("현재 alias = \(alias), 바뀌기 전 alias = \(oldValue)")
//        }
//    }
//}
//
//let sodeul: Sodeul = .init()
//sodeul.alias = "소들이"
//


//func solution(_ s:String) -> String {
//
//    let arr = s.split(separator: " ").map{ String($0) }
//    var answerArr:[String] = []
//    for ele in arr {
//        let eleLower = ele.lowercased()
//        if let char = eleLower.first, char.isLetter {
//            answerArr.append(eleLower.replacingOccurrences(of: String(char), with: String(char.uppercased())))
//        } else {
//            answerArr.append(eleLower)
//        }
//    }
//    return answerArr.joined(separator: " ")
//}


//func solution(_ files:[String]) -> [String] {
//    let firstSort = files.sorted { first, second in
//        var first = first
//        var second = second
//
//        var head1 = ""
//        var number1 = ""
//        var tail1 = ""
//
//        var check = false
//        for char in first {
//            if !char.isNumber && !check {
//                head1 += String(first.removeFirst())
//            } else if !char.isNumber && check {
//                break
//            } else {
//                check = true
//                number1 += String(first.removeFirst())
//            }
//        }
//        tail1 += String(first)
//
//        var head2 = ""
//        var number2 = ""
//        var tail2 = ""
//
//        check = false
//        for char in second {
//            if !char.isNumber && !check {
//                head2 += String(second.removeFirst())
//            } else if !char.isNumber && check {
//                break
//            } else {
//                check = true
//                number2 += String(second.removeFirst())
//            }
//        }
//        tail2 += String(second)
//
//        return head1.lowercased() > head2.lowercased()
//    }
//    return firstSort
//}


//var answer: [String] = []
//
//func solution(_ tickets:[[String]]) -> [String] {
//    var cnt = 0
//    answer = []
//    for ticket in tickets {
//        if ticket[0] == "ICN" {
//            var visited = Array.init(repeating: false, count: tickets.count)
//            visited[cnt] = true
//            dfs(tickets: tickets, ticket: ticket, visited: visited, route: [] + [ticket[0]])
//        }
//        cnt += 1
//    }
//    return answer
//}
//
//func dfs(tickets:[[String]], ticket: [String], visited: [Bool], route: [String]) {
//    if route.count == visited.count {
//        let hi = route + [ticket[1]]
//        if answer.isEmpty {
//            answer = hi
//        } else {
//            var check = false
//            for (idx, value) in answer.enumerated() {
//                if value > hi[idx] {
//                    check = true
//                    break
//                } else if value < hi[idx] {
//                    break
//                }
//            }
//            if check {
//                answer = hi
//            }
//        }
//        return
//    }
//    var cnt = 0
//    for nextTicket in tickets {
//        if !visited[cnt], nextTicket[0] == ticket[1] {
//            var newVisited = visited
//            newVisited[cnt] = true
//            dfs(tickets: tickets, ticket: nextTicket, visited: newVisited, route: route + [nextTicket[0]])
//        }
//        cnt += 1
//    }
//}
//
//print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))
//print("SFO" > "ICN")
//print("ATL" < "SFO")


//func solution(_ d:[Int], _ budget:Int) -> Int {
//    let d = d.sorted()
//    var answer = 0
//    var budget = budget
//    for i in d {
//        if budget - i >= 0 {
//            budget -= i
//            answer += 1
//        } else {
//            break
//        }
//    }
//    return answer
//}
//
//print(solution([1,3,2,5,4], 9))

//var originRock: [Int] = []
//var answer: Int = 0
//
//func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
//    originRock = rocks
//    answer = 0
//    if rocks.count == n {
//        return distance
//    }
//    combination(distance: distance, rocks: rocks.sorted(), n: n, visited: Array.init(repeating: false, count: rocks.count))
//    return answer
//}
//
//func combination(distance:Int, rocks: [Int], n:Int, visited:[Bool]) {
//    if originRock.count - n == rocks.count {
//        var rocks = rocks
//        rocks.append(distance)
//        var start = 0
//        var minVal = Int.max
//        for i in rocks {
//            minVal = min(minVal, i - start)
//            start = i
//        }
//        answer = max(answer, minVal)
//        return
//    }
//    let num = rocks.count
//    for i in 0..<num {
//        if !visited[i] {
//            var rocks = rocks
//            var visited = visited
//            rocks.remove(at: i)
//            visited[i] = true
//            combination(distance: distance, rocks: rocks, n: n, visited: visited)
//        }
//    }
//}
//
//print(solution(25, [2, 14, 11, 21, 17], 2))

//2 11 14 17 21 25


//func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
//    var currentLine = k
//    var arr:[Int : Bool] = [:]
//    for i in 0..<n {
//        arr[i] = true
//    }
//    var recentDelete: [Int] = []
//    for ele in cmd {
//        if ele.count == 3 {
//            let a = ele.split(separator: " ").map{ String($0) }
//            guard let idx = Int(a[1])  else { break }
//            if a[0] == "U" {
//                var cnt = 0
//                for i in 0..<currentLine {
//                    if arr[i] == false {
//                        cnt += 1
//                    }
//                }
//                currentLine -= (idx + cnt)
////                print("currentLine U : ", currentLine)
//            } else if a[0] == "D" {
//                var cnt = 0
//                for i in currentLine..<arr.count {
//                    if arr[i] == false {
//                        cnt += 1
//                    }
//                }
//                currentLine += (idx + cnt)
////                print("currentLine D : ", currentLine)
//            }
//        } else {
//            if ele == "C" {
//                arr[currentLine] = false
////                print("arr C : ", arr)
//                recentDelete.append(currentLine)
//                currentLine += 1
//                if currentLine == arr.count {
//                    currentLine -= 1
//                }
//            } else if ele == "Z" {
//                let hi = recentDelete.removeLast() as Int
//                arr[hi] = true
////                print("arr Z : ", arr)
//            }
//        }
//    }
//    var answer: String = ""
//    for i in 0..<arr.count {
//        if arr[i] == false {
//            answer += "X"
//        } else {
//            answer += "O"
//        }
//    }
//    return answer
//}
//
//
//print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]))

//var arr:[[Int]] = []
//for _ in 0..<9 {
//    arr.append(Array(readLine()!).split(separator: " ").map{Int(String($0))!})
//}


var arr: [[Int]] = [[0, 3, 5, 4, 6, 9, 2, 7, 8],
                    [7, 8, 2, 1, 0, 5, 6, 0, 9],
                    [0, 6, 0, 2, 7, 8, 1, 3, 5],
                    [3, 2, 1, 0, 4, 6, 8, 9, 7],
                    [8, 0, 4, 9, 1, 3, 5, 0, 6],
                    [5, 9, 6, 8, 2, 0, 4, 1, 3],
                    [9, 1, 7, 6, 5, 2, 0, 8, 0],
                    [6, 0, 3, 7, 0, 1, 9, 5, 2],
                    [2, 5, 8, 3, 9, 4, 7, 6, 0]]
var reverseArr:[[Int]] = arr
for i in 0..<9 {
    for j in 0..<9 {
        if i != j {
            let temp = arr[i][j]
            reverseArr[i][j] = arr[j][i]
            reverseArr[j][i] = temp
        }
    }
}

//var hi:[Int] = [1,2,3,4,5,6,7,8,9]
//
//for i in 0..<9 {
//    var hi:[Int] = [1,2,3,4,5,6,7,8,9]
//    var remember = 0
//    for j in 0..<9 {
//        let idx = hi.first{ $0 == arr[i][j] }
//        if idx != nil {
//            hi.remove(at: idx!)
//        } else {
//            remember = j
//        }
//    }
//    if hi.count == 1 {
//        arr[i][remember] = hi[0]
//    }
//
//    hi = [1,2,3,4,5,6,7,8,9]
//    remember = 0
//
//    for j in 0..<9 {
//        let idx = hi.first{ $0 == arr[j][i] }
//        if idx != nil {
//            hi.remove(at: idx!)
//        } else {
//            remember = j
//        }
//    }
//
//    if hi.count == 1 {
//        arr[remember][i] = hi[0]
//    }
//}
//
//for i in arr {
//    print(i)
//}
