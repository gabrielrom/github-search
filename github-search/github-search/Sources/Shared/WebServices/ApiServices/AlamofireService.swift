import Alamofire
import Foundation

class AlamofireService: IApiService {
  func listRepositoriesByLanguage(lang: String = "Swift", page: Int, perPage: Int, onCompleted: @escaping ([Repository]) -> Void) -> Void{
    let parameters: [String: String] = [
      "q": "language:\(lang)",
      "sort": "stars",
      "page": "\(page)",
      "per_page": "\(perPage)"
    ]
    
    AF.request(
      "https://api.github.com/search/repositories",
      method: .get,
      parameters: parameters,
      encoder: .urlEncodedForm
    ).validate()
     .responseDecodable(of: Repositories.self) { data in
      guard let repos = data.value else { return }
      onCompleted(repos.items)
    }
  }
}
