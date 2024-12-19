var matrix = [
    [0,1,1,0,0,0,1],
    [1,0,1,1,0,0,0],
    [1,1,0,0,0,0,0],
    [0,1,0,0,1,0,0],
    [0,0,0,1,0,1,0],
    [0,0,0,0,1,0,1],
    [1,0,0,0,0,1,0]
]

var size = matrix.count
var graph = Graph(matrix: matrix, size: size)


if graph.BFS(begin: 1, end: 6) {
    print("Path is TRUE")
    for path in graph.paths {
        print("path -> \(path)")
    }
} else {
    print("Path is FALSE")
}

// --------------------------------------

matrix = [
    [0,1,0,1,0,0],
    [0,0,0,0,0,1],
    [0,1,0,0,0,0],
    [0,0,0,0,0,1],
    [0,0,0,0,0,0],
    [0,0,0,0,1,0]
]

size = matrix.count
graph = Graph(matrix: matrix, size: size)

if graph.kanSort() {
    print("Топологическая сортировка")
    for path in graph.paths.reversed() {
        print("path -> \(path)")
    }
} else {
    print("Топологическая сортировка невозможна")
}


// --------------------------------------

matrix = [
    [0,1,0,1,0,0],
    [0,0,0,0,0,1],
    [0,1,0,0,0,0],
    [0,0,0,0,0,1],
    [0,0,0,0,0,0],
    [0,0,0,0,1,0]
]

size = matrix.count
graph = Graph(matrix: matrix, size: size)

if graph.demukronSort() {
    print("Демукрона сортировка")
    for path in graph.paths.reversed() {
        print("path -> \(path)")
    }
} else {
    print("Демукрона сортировка невозможна")
}

// --------------------------------------

matrix = [
    [0,1,0,1,0,0],
    [0,0,0,0,0,1],
    [0,1,0,0,0,0],
    [0,0,0,0,0,1],
    [0,0,0,0,0,0],
    [0,0,0,0,1,0]
]

size = matrix.count
graph = Graph(matrix: matrix, size: size)

if graph.tarianSort() {
    print("Тарьян сортировка")
    for path in graph.paths.reversed() {
        print("path -> \(path)")
    }
} else {
    print("Тарьян сортировка невозможна")
}


// --------------------------------------

matrix = [
    [0,1,0,0,0,0,0,0],
    [0,0,1,0,1,1,0,0],
    [0,0,0,1,0,0,1,0],
    [0,0,1,0,0,0,0,1],
    [1,0,0,0,0,1,0,0],
    [0,0,0,0,0,0,1,0],
    [0,0,0,0,0,1,0,0],
    [0,0,0,1,0,0,1,0],
]

size = matrix.count
graph = Graph(matrix: matrix, size: size)

graph.searchKosaraiu()
print("Компоненты сильной связи:")

graph.components.forEach { v in
    v.forEach { k in
        print(k, separator: " ")
    }
    print()
}
