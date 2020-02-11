import XCTest
import CasePaths
@testable import CasePaths_Extensions

enum Authentication: Equatable {
  case authenticated(accessToken: String)
  case unauthenticated
}

final class CasePaths_ExtensionsTests: XCTestCase {
    let userIn = Authentication.authenticated(accessToken: "123")
    let userOut = Authentication.unauthenticated

    func testMatches() {
        XCTAssertTrue((/Authentication.authenticated).matches(userIn))
        XCTAssertFalse((/Authentication.unauthenticated).matches(userIn))
    }
    
    func testMap() {
        XCTAssertEqual((/Authentication.authenticated).map(userIn, { $0.count }), 3)
        XCTAssertNil((/Authentication.authenticated).map(userOut, { $0.count }))
    }
    
    func testMutate() {
        let expected = Authentication.authenticated(accessToken: ">>123<<")
        XCTAssertEqual((/Authentication.authenticated).mutate(userIn, { ">>\($0)<<" }), expected)
    }
    
    func testMutateInCollection() {
        let users = [
            Authentication.authenticated(accessToken: "1"),
            .unauthenticated,
            .authenticated(accessToken: "22"),
        ]
        
        XCTAssertEqual(
            users.compactMap({ (/Authentication.authenticated).mutate($0, { ">>\($0)<<" }) }),
            [
                Authentication.authenticated(accessToken: ">>1<<"),
                .authenticated(accessToken: ">>22<<")
            ]
        )
    }

//    static var allTests = [
//        ("testExample", testExample),
//    ]
}
