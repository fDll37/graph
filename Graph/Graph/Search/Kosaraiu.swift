extension Graph {
    
    func searchKosaraiu() {
        var reverse = Array(repeating: Array(repeating: 0, count: size), count: size)
        
        for i in 0..<size {
            for j in 0..<size {
                reverse[i][j] = matrix[j][i]
            }
        }
        
        let vStack = Stack<Int>()
        clear()
        
        for i in 0..<size {
            DFS(array: reverse, v: i, stack: vStack)
        }
        
        clear()
        components.clear()
        let stack = Stack<Int>()
        
        while vStack.any() {
            let z = vStack.pop()!
            DFS(array: matrix, v: z, stack: stack)
            var list = List<Int>()
            
            while stack.any() {
                list.insert(value: stack.pop()! + 1)
            }
            if list.count > 0 {
                components.insert(value: list)
            }
        }
        return
    }
    
    func DFS(array: [[Int]], v: Int, stack: Stack<Int>) {
        if vertex[v] != .noDetected { return }
        
        vertex[v] = .detected
        
        for i in 0..<size {
            
            if array[v][i] == 0 {
                continue
            }
            DFS(array: array, v: i, stack: stack)
        }
        stack.push(new: v)
        return
    }
    
    
}
