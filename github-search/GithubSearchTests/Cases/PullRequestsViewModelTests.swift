import XCTest
@testable import github_search

class PullRequestsViewModelTests: XCTestCase {
  
  var pullRequestsViewModel: PullRequestViewModel!
  
  override func setUp() {
    super.setUp()
    
    pullRequestsViewModel = PullRequestViewModel(
      pullRequestService: ApiServiceMock()
    )
  }
  
  func testShouldBeAbleToFormatDateByGivenDate() {
    let dateToFormat = "2018-09-02T12:06:52Z"
    let dateFormatted = pullRequestsViewModel.formatStringPullRequestDate(date: dateToFormat)
    
    XCTAssertEqual("09/2018", dateFormatted)
    XCTAssertNotNil(dateFormatted, "The date do not match with date format or is empty")
  }
  
  func testShouldNotBeAbleToFormatDateWithGivenInvalidDate() {
    let dateToFormat = "2018090212:06:52Z"
    let dateFormatted = pullRequestsViewModel.formatStringPullRequestDate(date: dateToFormat)
    
    let dateEmptyToFormat = ""
    let result = pullRequestsViewModel.formatStringPullRequestDate(date: dateEmptyToFormat)
    
    XCTAssertNil(dateFormatted, "The date match with the format YYYY-MM-DDTHH:MM:SSZ")
    XCTAssertNil(result, "The date is not empty")
  }
  
  func testShouldBeAbleToFetchPullRequests() {
    pullRequestsViewModel.fetchItems(
      ownerRepo: "jhon doe",
      repoName: "jhon tests"
    )
    
    XCTAssertNotNil(pullRequestsViewModel.pullRequests.value.first)
    XCTAssertTrue(pullRequestsViewModel.pullRequests.value.count == 1)
    XCTAssertEqual(pullRequestsViewModel.pullRequests.value.first?.title, "RxSwift Fix")
    XCTAssertEqual(pullRequestsViewModel.pullRequests.value.first?.user.login, "jhon doe")
  }
  
  func testShouldBeAbleToLoadMorePullRequests() {
    pullRequestsViewModel.fetchItems(
      ownerRepo: "test",
      repoName: "test"
    )
    
    pullRequestsViewModel.getMorePullRequests(
      ownerRepo: "test",
      repoName: "test"
    )
    
    XCTAssertNotNil(pullRequestsViewModel.pullRequests.value)
    XCTAssertNotNil(pullRequestsViewModel.pullRequests.value.first?.id)
    XCTAssertNotNil(pullRequestsViewModel.pullRequests.value.last?.id)
    XCTAssertTrue(pullRequestsViewModel.pullRequests.value.count == 2)
  }
}
