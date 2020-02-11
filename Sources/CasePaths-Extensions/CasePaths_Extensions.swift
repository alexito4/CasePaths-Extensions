import CasePaths

extension CasePath {
    func matches(_ other: Root) -> Bool {
        return extract(from: other) != nil
    }
}

extension CasePath {
    func map<R>(_ root: Root, _ f: (Value) -> (R)) -> R? {
        extract(from: root).map(f)
    }
    
    func mutate(_ root: Root, _ f: (Value) -> (Value)) -> Root? {
        guard let newValue = extract(from: root).map(f) else {
            return nil
        }
        return embed(newValue)
    }
}
