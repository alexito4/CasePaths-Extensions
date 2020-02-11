# CasePaths-Extensions

Some simple [CasePaths](https://github.com/pointfreeco/swift-case-paths) extensions.

# matches

Useful to use in `if` conditions:

```swift
let state = Authentication.authenticated(accessToken: "123")

if (/Authentication.unauthenticated).matches(state) {
    print("unauthenticated")
} else {
    print("you're in!")
}
```

# map

As with `Optional.map` it transforms a value only if the enum is of the expected case.

```swift
let userIn = Authentication.authenticated(accessToken: "123")
let userOut = Authentication.unauthenticated

(/Authentication.authenticated).map(userIn, { $0.count }) // 3
((/Authentication.authenticated).map(userOut, { $0.count }) // nil
```

# mutate

Similar to `map` but instead of returning any new type, it returns a new enum with a transformed value, only if the enum case matches.

```swift
(/Authentication.authenticated).mutate(userIn, { ">>\($0)<<" })
// returns Authentication.authenticated(accessToken: ">>123<<")

```

# Author

Alejandro Martinez | http://alejandromp.com | [@alexito4](https://twitter.com/alexito4)


