import Foundation

// 树的遍历是树操作的基础
class Tree {
    // A.Tree 的遍歷
    
    
    // 1.前序遍历（Preorder Traversal）访问根节点，然后访问左子树，最后访问右子树
    
    // 递归前序遍历
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        preorder(root, &result)
        return result
    }
    
    private func preorder(_ root: TreeNode?, _ result: inout [Int]) {
        guard let root = root else { return }
        result.append(root.val)
        preorder(root.left, &result)
        preorder(root.right, &result)
    }
    
    // 迭代前序遍历
    func preorderTraversalIterative(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        guard let root = root else { return result }
        var stack: [TreeNode] = [root]
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            result.append(node.val)
            if let right = node.right {
                stack.append(right)
            }
            if let left = node.left {
                stack.append(left)
            }
        }
        return result
    }
    
    // 2.中序遍历（Inorder Traversal）：访问左子树，然后访问根节点，最后访问右子树
    
    // 3.后序遍历（Postorder Traversal）：访问左子树，然后访问右子树，最后访问根节点
    
    // 4.层次遍历（Level-order Traversal）：按层次从上到下，从左到右访问节点，通常使用队列来实现
    
    
    // B.Tree 的最大深度 DFS
    func maxDepth(_ root: TreeNode?) -> Int {
        // 遞歸
        var max = 0
        if root == nil {
            return 0
        }
        
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
    
    
    // C.Tree 的最小深度 BFS
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue: [(TreeNode, Int)] = [(root, 1)]
        
        while !queue.isEmpty {
            let (node, depth) = queue.removeFirst()
            if node.left == nil && node.right == nil {
                return depth
            }
            if let left = node.left {
                queue.append((left, depth + 1))
            }
            if let right = node.right {
                queue.append((right, depth + 1))
            }
        }
        return 0
    }
    
    // D. 检查二叉树是否为平衡二叉树
    // 树的每个节点的两个子树的高度差不超过1
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        return checkBalance(root) != -1
    }
    
    private func checkBalance(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let leftHeight = checkBalance(root.left)
        let rightHeight = checkBalance(root.right)
        
        if leftHeight == -1 || rightHeight == -1 || abs(leftHeight - rightHeight) > 1 {
            return -1
        }
        return max(leftHeight, rightHeight) + 1
    }
    
    
    // E.二叉树的最近公共祖先
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        if root === p || root === q { return root }
        
        let left = lowestCommonAncestor(root.left, p, q)
        let right = lowestCommonAncestor(root.right, p, q)
        
        if left != nil && right != nil { return root }
        return left ?? right
    }
    
    // F. 二叉树的路径和 查找从根节点到叶子节点的所有路径，使得路径上的节点值之和等于给定的目标值。
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        if root.left == nil && root.right == nil {
            return root.val == sum
        }
        return hasPathSum(root.left, sum - root.val) || hasPathSum(root.right, sum - root.val)
    }
}

