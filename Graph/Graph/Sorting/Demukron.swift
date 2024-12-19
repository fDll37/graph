extension Graph {
    
    func demukronSort() -> Bool {
         
        paths.clear()
        
        var weight: [Int] = Array(repeating: 0, count: size)
        var visited: [Bool] = Array(repeating: false, count: size)
        
        var sum = 0
        
        for i in 0..<size {
            
            for j in 0..<size {
                weight[i] += matrix[j][i]
                sum += matrix[j][i]
            }
        }
        
        repeat {
            var isAny = false
            
            for i in 0..<size {
                if visited[i] { continue }
                if weight[i] > 0 { continue }
                
                visited[i] = true
                isAny = true
                
                paths.insert(value: i + 1)
                
                for j in 0..<size {
                    weight[j] -= matrix[i][j]
                    sum -= matrix[i][j]
                }
                break
            }
            if !isAny { return false }
            
        } while sum > 0
        
        for i in 0..<size {
            if visited[i] == false {
                paths.insert(value: i + 1)
            }
        }
        
        return true
    }
}
