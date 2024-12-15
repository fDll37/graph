final class Stack<T> {
    
    private var storage: [T] = []
    var isEmpty: Bool { storage.count == 0 }
    var count: Int { storage.count }
    
    func push(new: T) {
        storage.append(new)
    }
    
    func pop() -> T? {
        storage.popLast()
    }
}


extension Stack: Sequence {
    func makeIterator() -> stackIterator {
        stackIterator(currentIndex: 0, stack: self)
    }
    
    struct stackIterator: IteratorProtocol {
        var currentIndex: Int
        var stack: Stack<T>
        
        init(currentIndex: Int, stack: Stack<T>) {
            self.currentIndex = currentIndex
            self.stack = stack
        }
        
        mutating func next() -> T? {
            if currentIndex < stack.storage.count {
                let value = stack.storage[currentIndex]
                currentIndex += 1
                return value
            }
            return nil
        }
    }
}
