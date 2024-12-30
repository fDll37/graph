extension ShortestGraph {
    
    func deikstra(vertex: Int) -> [Int] {
        var ways = Array(repeating: weightFull, count: size)
        var visited = Array(repeating: false, count: size)
        ways[vertex] = 0
        var min = 0
        
        for k in 0..<size {
            min = getMin(array: ways, visited: visited)
            visited[min] = true
            
            for i in 0..<size {
                if visited[i] == true { continue }
                if matrix[min][i] == 0 { continue }
                
                let weight = ways[min] + matrix[min][i]
                if weight < ways[i] {
                    ways[i] = weight
                }
            }
        }
        return ways
    }
    
    func getMin(array: [Int], visited: [Bool]) -> Int {
        var min = -1
        
        for i in 0..<array.count {
            if visited[i] == true { continue }
            if min == -1 {
                min = i
            } else if array[i] < array[min] {
                min = i
            }
        }
        return min
    }
    
}
