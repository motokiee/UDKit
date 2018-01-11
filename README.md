
# LocalDataStore

**This library is under development and will be renamed to LocalDataStore**

LocalDataStore provides wrapper classes for local storage like UserDefaults, NSCache and FileManager.


## Usage

```swift
// Defaults
let key = Key<Int>(“int_key”)
Defaults.set(value: 100, for: key)

// Documents, Tmp, Cache
File.set(.documents, for: key)
File.set(.tmp, for: key)
File.set(.cache, for: key)
```
