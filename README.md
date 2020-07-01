# LazyGridPolyfill

`LazyVGrid` for iOS < 14 users. One transparent API:

```swift
import SwiftUI
import LazyGridPolyfill

struct HelloWorld: View {

  var body: some View {
    ScrollView {
      Text("I Am A Header")
      
      Grid() {
        ForEach(items) { item in
          render(item: item)
        }
      }
    }
  }
}
```

Uses some magic trickery under the hood for iOS 13, and for iOS 14, it is a fully functional LazyVGrid.

### Integration

#### SPM

to be added

### Under the hood

It uses a func on `View` of `isInViewPort` which gets called when the `View` is in the `UIScreen.main.bounds`. Also it features real lazy traversing of `ForEach` items.

Using `isInViewPort` is totally possible for using for instance infinite scroll. 

Example:

```swift
Button(action: loadMore) {
  Text("Load More!")
}.isInViewPort {
  if loadMoreIsInViewPort != $0 {
    loadMoreIsInViewPort = $0
    if $0 {
      loadMore()
    }
  }
}
```


