import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DSProgressHudTests.allTests),
    ]
}
#endif
