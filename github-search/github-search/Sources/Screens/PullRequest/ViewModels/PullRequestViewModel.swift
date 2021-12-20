import Foundation
import RxSwift
import RxRelay


class PullRequestViewModel {
  var pullRequests = BehaviorRelay<[PullRequests]>(value: [])
  var pullRequestService: IApiService
  
  var isDataLoaded = BehaviorRelay<Bool>(value: false)
  var loadingMoreData = false
  
  init(pullRequestService: IApiService) {
    self.pullRequestService = pullRequestService
  }
  
  func fetchItems(ownerRepo: String, repoName: String, page: Int = 1) -> Void {
    pullRequestService.listPullRequests(ownerRepo: ownerRepo, repoName: repoName, page: page, perPage: 50) { [weak self] pullRequests in
      self?.pullRequests.accept(pullRequests)
      self?.isDataLoaded.accept(true)
    }
  }
  
  func getMorePullRequests(ownerRepo: String, repoName: String, page: Int = 1) -> Void {
    loadingMoreData = true
    
    pullRequestService.listPullRequests(ownerRepo: ownerRepo, repoName: repoName, page: page, perPage: 50) { [weak self] pullRequests in
      var newValues = self?.pullRequests.value
      newValues?.append(contentsOf: pullRequests)
      
      self?.pullRequests.accept(newValues!)
      self?.loadingMoreData = false
    }
  }
  
  func formatStringPullRequestDate(date: String) -> String {
    let dateArray = date.split(separator: "T")
    let dateOnlyMonthAndYears = dateArray[0].split(separator: "-")
    
    return "\(dateOnlyMonthAndYears[1])/\(dateOnlyMonthAndYears[0])"
  }
}

