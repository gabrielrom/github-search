import Foundation
@testable import github_search

class ApiServiceMock: IApiService {
  func listRepositoriesByLanguage(
    lang: String,
    page: Int,
    perPage: Int,
    onCompleted: @escaping ([Repository]) -> Void
  ) {
    let repositories = [Repository]()
    onCompleted(repositories)
  }
  
  func listPullRequests(
    ownerRepo: String,
    repoName: String,
    page: Int,
    perPage: Int,
    onCompleted: @escaping ([PullRequests]) -> Void
  ) {
    let pullRequests = [PullRequests.fixture()]
    onCompleted(pullRequests)
  }
}
