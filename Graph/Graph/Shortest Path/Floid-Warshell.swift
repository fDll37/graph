extension ShortestGraph {
    
    func floidWarshell() -> [[Int]] {
        var ways: [[Int]] = Array(repeating: Array(repeating: 0, count: size), count: size)
        
        for i in 0..<size {
            for j in 0..<size {
                if i == j {
                    ways[i][j] = 0
                } else if matrix[i][j] == 0 {
                    ways[i][j] = weightFull
                } else {
                    ways[i][j] = matrix[i][j]
                }
            }
        }
        
        for k in 0..<size {
            for i in 0..<size {
                if k == i { continue }
                for j in 0..<size {
                    if k == j { continue }
                    if i == j { continue }
                    
                    if ways[i][k] + ways[k][j] < ways[i][j] {
                        ways[i][j] = ways[i][k] + ways[k][j]
                    }
                }
            }
        }
        return ways
    }
    
}
