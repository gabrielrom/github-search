import Foundation

struct PullRequests: Decodable {
  let id: Int
  let title: String
  let body: String
  let state: String
  let user: User
  let labels: [Labels]
  let html_url: String
  let merged_at: String?
  let created_at: String
}

struct User: Decodable {
  let login: String
  let avatar_url: String
}

struct Labels: Decodable {
  let name: String
  let color: String
}
