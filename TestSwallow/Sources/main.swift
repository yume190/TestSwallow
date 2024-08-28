import Foundation
import Swallow
import FoundationX
import _PythonString
import FoundationXDependency

print("Env[USE_PREBUILT]:", ProcessInfo.processInfo.environment["USE_PREBUILT"] ?? "nil")

print(swallow())
print(foundationX())
print(python())
print(dependency())

print("Hello, world!")
