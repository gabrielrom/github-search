import Foundation

protocol IApiService {
  func listRepositoriesByLanguage(
    lang: String,
    page: Int,
    perPage: Int,
    onCompleted: @escaping ([Repository]) -> Void) -> Void
  
  func listPullRequests(
    ownerRepo: String,
    repoName: String,
    page: Int,
    perPage: Int,
    onCompleted: @escaping ([PullRequests]) -> Void) -> Void
}
