import CasePaths

extension CasePath {
    public func matches(_ other: Root) -> Bool {
        return extract(from: other) != nil
    }
}

extension CasePath {
    public func map<R>(_ root: Root, _ f: (Value) -> (R)) -> R? {
        extract(from: root).map(f)
    }
    
    public func mutate(_ root: Root, _ f: (Value) -> (Value)) -> Root? {
        guard let newValue = extract(from: root).map(f) else {
            return nil
        }
        return embed(newValue)
    }
}
