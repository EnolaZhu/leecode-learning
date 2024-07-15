import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

// 中序遍歷
class Solution100 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        return inorderTraversal(p, q)
    }
    
    private func inorderTraversal(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        // 如果两个节点都是 nil，说明到达了树的末端，返回 true
        if p == nil && q == nil {
            return true
        }
        
        // 如果一个节点是 nil 而另一个不是，说明树结构不同，返回 false
        if p == nil || q == nil {
            return false
        }
        
        // 递归比较左子树
        if !isSameTree(p?.left, q?.left) {
            return false
        }
        
        // 比较当前节点的值
        if p?.val != q?.val {
            return false
        }
        
        // 递归比较右子树
        if !isSameTree(p?.right, q?.right) {
            return false
        }
        
        return true
    }
}


// 中序遍歷
// 1.访问左子树：首先递归地对左子树进行中序遍历。
// 2.访问根节点：然后访问根节点。
// 3.访问右子树：最后递归地对右子树进行中序遍历。
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    inorderHelper(root, &result)
    return result
}

private func inorderHelper(_ node: TreeNode?, _ result: inout [Int]) {
    guard let node = node else { return }
    inorderHelper(node.left, &result)   // 访问左子树
    result.append(node.val)             // 访问根节点
    inorderHelper(node.right, &result)  // 访问右子树
}


