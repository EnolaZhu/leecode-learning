import Foundation

class Solution104 {
    func maxDepth(_ root: TreeNode?) -> Int {
        // 遞歸
        if root == nil {
            return 0
        }
        
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
    
    func maxDepthByDFS(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        // 使用显式栈来模拟递归过程
        var stack: [(TreeNode, Int)] = [(root, 1)]
        var maxDepth = 0
        
        while !stack.isEmpty {
            let (node, depth) = stack.removeLast()
            maxDepth = max(maxDepth, depth)
            
            if let left = node.left {
                stack.append((left, depth + 1))
            }
            if let right = node.right {
                stack.append((right, depth + 1))
            }
        }
        
        return maxDepth
    }
}

