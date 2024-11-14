import Foundation

class Solution268 {


//Input: nums = [0,1]
//Output: 2
//Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.
    func missingNumber(_ nums: [Int]) -> Int {
        var result = 0
        let maxCount = nums.count
        // let newNums = [0, .., maxCount]
        var numsSet = Set<Int>()

        for num in nums {
            numsSet.insert(num)
        }


        for i in 0...maxCount {
            if !numsSet.contains(i) {
                result = i
            }
        }

        return result
    }
}
