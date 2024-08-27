#  Use Fake Swallow XCFramework

---

## All Test

```bash
cd TestSwallow
make test
```

---

```bash
cd TestSwallow
scipio prepare --support-simulators
```

## Mac Framework

```bash
cd TestSwallow

cd XCFrameworks/FoundationX.xcframework/macos-arm64_x86_64/FoundationX.framework/
mkdir -p Versions/A
# cp all to Versions/A
```

## Mac APP

code sign -> remove sanbox
