final class ShortestGraph {
    
    var matrix: [[Int]]
    var size: Int
    var weightFull = 0
    
    init(matrix: [[Int]], size: Int) {
        self.matrix = matrix
        self.size = size
        weightFull = findWeight()
    }
    
    func findWeight() -> Int {
        var w = 0
        for i in 0..<size {
            for j in 0..<size {
                w += abs(matrix[i][j])
            }
        }
        
        return w
    }
}
