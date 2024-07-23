import Foundation

//找到具有最大和的连续子数组，并返回其和。
/*Example 1:

 Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
 Output: 6
 Explanation: The subarray [4,-1,2,1] has the largest sum 6.
 */

class Solution53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = nums[0]
        var currentSum = nums[0]

        for num in nums.dropFirst() {
            // 正是因为我们在寻找一个连续的子数组的最大和，所以我们必须比较当前元素和将当前元素添加到现有子数组和之间的较大值
            currentSum = max(num, currentSum + num)
            maxSum = max(currentSum, maxSum)
        }

        return  maxSum
    }
}
