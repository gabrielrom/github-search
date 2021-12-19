import Foundation

protocol IApiService {
  func listRepositoriesByLanguage(
    lang: String,
    page: Int,
    perPage: Int,
    onCompleted: @escaping ([Repository]) -> Void) -> Void
}
