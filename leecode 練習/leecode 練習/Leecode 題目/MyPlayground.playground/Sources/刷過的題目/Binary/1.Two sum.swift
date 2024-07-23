import Foundation

class Solution1 {

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        // // 暴力解法, 時間複雜度 log*n*2
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }

        return []
    }

    func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        // key is element, value is index

        for i in 0..<nums.count {

            var t = target - nums[i]
            if let v = map[t] {
                return [i, v]
            } else {
                map[nums[i]] = i
            }
        }
        return []
    }


}
