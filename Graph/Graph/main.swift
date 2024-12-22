var matrix = [
    [0,1,1,0,1,0,1],
    [1,0,1,1,0,0,0],
    [1,1,0,0,0,0,0],
    [0,1,0,0,1,0,0],
    [1,0,0,1,0,1,0],
    [0,0,0,0,1,0,1],
    [1,0,0,0,0,1,0]
]

var size = matrix.count
var graph = SkeletonGraph(matrix: matrix, size: size)


if graph.skeletonBFS(begin: 0) {
    print("Path is TRUE")
    for egde in graph.edges {
        print("egde -> \(egde.begin + 1) - \(egde.end + 1)")
    }
} else {
    print("Path is FALSE")
}

