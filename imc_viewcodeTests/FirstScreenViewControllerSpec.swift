import Foundation
import Nimble
import Quick
import Nimble_Snapshots
@testable import imc_viewcode


class FirstScreenViewControllerSpec: QuickSpec {
    override func spec() {
        describe("Test UI") {
            it("should have the expected look and feel") {
                let frame = UIScreen.main.bounds
                let view = FirstScreenViewController(frame: frame)
                expect(view) == recordSnapshot("FistScreenViewController")
            }
        }
    }
}
