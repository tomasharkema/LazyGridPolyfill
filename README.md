# LazyGridPolyfill

`LazyVGrid` for iOS < 14 users. Ensures full forwardscompatibility. One transparent API:

```
import SwiftUI
import LazyGridPolyfill

struct HelloWorld: View {

  var body: some View {
    ScrollView {
      Text("I Am A Header")
      
      Grid(columns: Int(fullWidth / size.projectedWidth), spacing: 1, fullWidth: fullWidth) {
        ForEach(items) { item in
          render(item: item)
        }
      }
    }
  }
}
```
