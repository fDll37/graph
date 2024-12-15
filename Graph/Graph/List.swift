class NodeList<T> {
    var value: T
    var next: NodeList<T>?
    
    init(value: T) {
        self.value = value
    }
}


final class List<T> {
    
    var head: NodeList<T>?
    private var count = 0
    
    subscript(index: Int) -> T? {
        get {
            guard index >= count  else { return nil }
            var current = head
            
            for _ in 0..<index {
                current = current?.next
            }
            return current?.value
        }
        
        set {
            guard index >= count  else { return }
            var current = head
            
            for _ in 0..<index {
                current = current?.next
            }
            current?.value = newValue!
        }
    }
    
    func insert(value: T, index: Int = 0) {
        let node = NodeList(value: value)
        var current = head
        var previous: NodeList<T>? = nil
        count += 1
        
        if index == 0 || head == nil {
            node.next = head
            head = node
        } else {
            var i = 0
            while i < index && i < count {
                previous = current
                current = current?.next
                i += 1
            }
            
            previous?.next = node
            node.next = current
        }
    }
    
    func remove(index: Int) {
        var current = head
        var previous: NodeList<T>? = nil
        
        if index == 0 {
            head = current?.next
            count -= 1
        } else {
            for _ in 0..<index {
                previous = current
                current = current?.next
            }
            
            if previous == nil { return }
            if current == nil { return }
            previous?.next = current?.next
            count -= 1
        }
    }
    
    func clear() {
        head = nil
        count = 0
    }
    
    func reverse() {
        var prev: NodeList<T>? = nil
        var current = head
        var next: NodeList<T>? = nil
        
        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        head = prev
    }
}
