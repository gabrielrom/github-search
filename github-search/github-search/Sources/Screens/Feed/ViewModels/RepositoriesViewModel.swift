import Foundation
import RxSwift
import RxRelay

class RepositoriesViewModel {
  var repositories = BehaviorRelay<[Repository]>(value: [])
  var repositoriesService: IApiService
  
  var isDataLoaded = BehaviorRelay<Bool>(value: false)
  var loadingMoreData = false
  
  init(repositoriesService: IApiService) {
    self.repositoriesService = repositoriesService
  }
  
  func fetchItems(page: Int = 1) -> Void {
    repositoriesService.listRepositoriesByLanguage(lang: "Swift", page: page, perPage: 80) { [weak self] repos in
      self?.repositories.accept(repos)
      self?.isDataLoaded.accept(true)
    }
  }
  
  func getMoreRepositories(page: Int) -> Void {
    loadingMoreData = true
    
    repositoriesService.listRepositoriesByLanguage(lang: "Swift", page: page, perPage: 80) { [weak self] repos in
      var newValues = self?.repositories.value
      newValues?.append(contentsOf: repos)
      
      self?.repositories.accept(newValues!)
      self?.loadingMoreData = false
    }
  }
}
