import Foundation
// 數組優化 很常考慮雙指針
class Solution121 {
    // 暴力解 兩個回圈
    // 時間複雜度 O(n^2)
    func maxProfit1(_ prices: [Int]) -> Int {
        var maxProfit = 0
        // set i is the buy day
        // j is the day of sold
        // j > i
        for i in 0..<prices.count {
            for j in i+1..<prices.count {
                maxProfit = max(maxProfit, prices[j]-prices[i])
            }
        }
        return maxProfit
    }
    
    // 動態規劃 通过一次遍历数组，在遍历的过程中不断更新最低价格和最大利润
    func maxProfit2(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        var maxProfit = 0
        var minPrice = prices[0]
        // 初始化最大利潤 最小的價格
        for price in prices {
            if minPrice > price {
                minPrice = price
            } else {
                // 最小的價格
                maxProfit = max(maxProfit,price - minPrice)
            }
        }
        return maxProfit
    }
    
    // 雙指針
    func maxProfit3(_ prices: [Int]) -> Int {
        // initial points
        var left = 0 // Buy
        var right = 1 // Sell
        var maxProfit = 0
        
        while right < prices.count {
            if prices[left] < prices[right] {
                let profit = prices[right] - prices[left]
                maxProfit = max(maxProfit, profit)
            } else {
                // If we found a lower price, move the left pointer to right
                left = right
            }
            right += 1
        }
        // 如果当前 left 指针指向的价格小于 right 指针指向的价格，计算利润并更新最大利润。
//        如果当前 left 指针指向的价格大于或等于 right 指针指向的价格，移动 left 指针到 right 指针的位置（因为我们想找到最低的买入价格）
        
        return maxProfit
    }
    
}




