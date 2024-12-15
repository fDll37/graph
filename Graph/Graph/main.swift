let matrix = [
    [0,1,1,0,0,0,1],
    [1,0,1,1,0,0,0],
    [1,1,0,0,0,0,0],
    [0,1,0,0,1,0,0],
    [0,0,0,1,0,1,0],
    [0,0,0,0,1,0,1],
    [1,0,0,0,0,1,0]
]

let size = matrix.count
let graph = Graph(matrix: matrix, size: size)


if graph.BFS(begin: 1, end: 6) {
    print("Path is TRUE")
    for path in graph.paths {
        print("path -> \(path)")
    }
} else {
    print("Path is FALSE")
}
