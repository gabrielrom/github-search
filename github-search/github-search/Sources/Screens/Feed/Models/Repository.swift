import Foundation

struct Repository: Decodable {
  let id: Int
  let owner: Owner
  let full_name: String
  let description: String? 
  let stargazers_count: Int
  let watchers_count: Int
  let forks_count: Int
  let updated_at: String
}

struct Owner: Decodable {
  let avatar_url: String
}
