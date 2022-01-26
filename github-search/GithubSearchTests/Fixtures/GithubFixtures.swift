@testable import github_search

//extension Repository {
//
//  static func fixture() -> Repository {
//
//
//
//  }
//
//}

extension PullRequests {
  static func fixture() -> PullRequests {
    return PullRequests(
      id: Int.random(in: 1..<5),
      title: "RxSwift Fix",
      body: "",
      state: "",
      user: User(login: "jhon doe", avatar_url: ""),
      labels: [Labels(name: "closed", color: "red")],
      html_url: "",
      merged_at: "",
      created_at: ""
    )
  }
}
