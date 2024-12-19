extension Graph {
    
    func kanSort() -> Bool {
        paths.clear()
        
        var isAny = false
        var countDeleteVertex = 0
        
        repeat {
            isAny = false
            countDeleteVertex = 0
            
            for i in 0..<size {
                var sum = 0
                if vertex[i] != .noDetected {
                    countDeleteVertex += 1
                    continue
                }
                
                for j in 0..<size {
                    if vertex[j] != .visited {
                        sum += matrix[j][i]
                    }
                }
                
                if sum == 0 {
                    vertex[i] = .visited
                    paths.insert(value: i + 1)
                    isAny = true
                    break
                }
            }
            
        } while isAny && (countDeleteVertex < size)
        
        return countDeleteVertex == size ? true : false
    }
}
