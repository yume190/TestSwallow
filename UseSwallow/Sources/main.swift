import Swallow
import FoundationX
import SwallowMacrosClient


print(DarwinNotification.self)
print(AnyCodingKey.self)
print("Hello, world!")

@Singleton
public final class DataStore: ObservableObject {
   public var id = UUID()
}

print(DataStore.shared)

