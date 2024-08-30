import Foundation
import Swallow
import FoundationX
import _PythonString
import FoundationXDependency

#if canImport(CTarget)
import CTarget
// import CppTarget
#endif
#if canImport(ObjcTarget)
import ObjcTarget
import ObjcppTarget
#endif


print("Env[USE_PREBUILT]:", ProcessInfo.processInfo.environment["USE_PREBUILT"] ?? "nil")
print("Env[USE_PREBUILT_V2]:", ProcessInfo.processInfo.environment["USE_PREBUILT_V2"] ?? "nil")

print(swallow())
print(foundationX())
print(python())
print(dependency())

print("Hello, world!")

#if canImport(CTarget)
c_target_test()
// cpp_target_test()
#endif
#if canImport(ObjcTarget)
ObjcTarget.HelloWorld().sayHello()
ObjcppTarget.HelloWorld2().sayHello()
#endif
