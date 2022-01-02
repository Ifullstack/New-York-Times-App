//
//  Filter+ViewModel.swift
//  New York Times App
//
//  Created by Cane Allesta on 1/1/22.
//

import Foundation

protocol FilterViewModelInput {
    func viewDidLoad()
    func doneButtonTapped()
}

protocol FilterViewModelOutput {
    var postsPeriodFiltersModel: Box<[PostFiltersModel]?> { get }
    var postsTypeFiltersModel: Box<[PostFiltersModel]?> { get }
    var mostSharedFiltersModel: Box<[PostFiltersModel]?> { get }
    var spinnerStatus: Box<SpinnerStatus?> { get }
    var error: Box<Error?> { get }
    var isMostSharedFilterSelected: Box<Bool?> { get }
}

protocol FilterViewModel: FilterViewModelInput,
                          FilterViewModelOutput,
                          RadioFiltersCellProtocol,
                          CheckBoxFiltersCellProtocol {}

extension DefaultFilterViewModel {
    enum FilterNames {
        static let oneDay = "1 día"
        static let sevenDays = "7 días"
        static let thirtyDays = "30 días"
        static let mostMailed = "Most Mailed"
        static let mostShared = "Most Shared"
        static let mostViewed = "Most Viewed"
        static let facebook = "Facebook"
        static let twitter = "Twitter"
    }
    enum FilterValues {
        static let oneDay = "1"
        static let sevenDays = "7"
        static let thirtyDays = "30"
        static let mostMailed = "emailed"
        static let mostShared = "shared"
        static let mostViewed = "viewed"
        static let facebook = "facebook"
        static let twitter = "twitter"
    }
}

class DefaultFilterViewModel: FilterViewModel {
    
    // Bindings
    var postsPeriodFiltersModel: Box<[PostFiltersModel]?> = Box(nil)
    var postsTypeFiltersModel: Box<[PostFiltersModel]?> = Box(nil)
    var mostSharedFiltersModel: Box<[PostFiltersModel]?> = Box(nil)
    var spinnerStatus: Box<SpinnerStatus?> = Box(nil)
    var error: Box<Error?> = Box(nil)
    var isMostSharedFilterSelected: Box<Bool?> = Box(nil)
 
    // Exposed Properties
    var sharedViewModel: SharedViewModel?

    init(sharedViewModel: SharedViewModel) {
        self.sharedViewModel = sharedViewModel
    }
    
    func viewDidLoad() {
        spinnerStatus.value = .start
        fetchFiltersModel()
    }
    
    func doneButtonTapped() {
        sharedViewModel?.fetchPosts(parameters: FetchPostsUseCaseParameters(postType: sharedViewModel?.postTypeSelected ?? "",
                                                                            period: sharedViewModel?.periodSelected ?? "",
                                                                            sharedType: sharedViewModel?.sharedTypeSelected ?? ""))
    }
}

// MARK: - Private Methods
extension DefaultFilterViewModel {
  
    private func fetchFiltersModel() {
        guard let sharedViewModel = sharedViewModel else { return }
        
        postsPeriodFiltersModel.value = [
            PostFiltersModel(filterName: FilterNames.oneDay,
                             filterType: .period,
                             filterValue: FilterValues.oneDay,
                             isFilterSelected: sharedViewModel.periodSelected == FilterValues.oneDay ? true : false),
            
            PostFiltersModel(filterName: FilterNames.sevenDays,
                             filterType: .period,
                             filterValue: FilterValues.sevenDays,
                             isFilterSelected: sharedViewModel.periodSelected == FilterValues.sevenDays ? true : false),
            
            PostFiltersModel(filterName: FilterNames.thirtyDays,
                             filterType: .period,
                             filterValue: FilterValues.thirtyDays,
                             isFilterSelected: sharedViewModel.periodSelected == FilterValues.thirtyDays ? true : false)
        ]
        
        postsTypeFiltersModel.value = [
            PostFiltersModel(filterName: FilterNames.mostMailed,
                             filterType: .postType,
                             filterValue: FilterValues.mostMailed,
                             isFilterSelected: sharedViewModel.postTypeSelected == FilterValues.mostMailed ? true : false),
            
            PostFiltersModel(filterName: FilterNames.mostShared,
                             filterType: .postType,
                             filterValue: FilterValues.mostShared,
                             isFilterSelected: sharedViewModel.postTypeSelected == FilterValues.mostShared ? true : false),
            
            PostFiltersModel(filterName: FilterNames.mostViewed,
                             filterType: .postType,
                             filterValue: FilterValues.mostViewed,
                             isFilterSelected: sharedViewModel.postTypeSelected == FilterValues.mostViewed ? true : false)
        ]
        
        mostSharedFiltersModel.value = [
            PostFiltersModel(filterName: FilterNames.facebook,
                             filterType: .mostSharedType,
                             filterValue: FilterValues.facebook,
                             isFilterSelected: sharedViewModel.sharedTypeSelected == FilterValues.facebook ? true : false),
            
            PostFiltersModel(filterName: FilterNames.twitter,
                             filterType: .mostSharedType,
                             filterValue: FilterValues.twitter,
                             isFilterSelected: sharedViewModel.sharedTypeSelected == FilterValues.twitter ? true : false)
        ]
        spinnerStatus.value = .stop
    }
}

// MARK: - RadioFiltersCellProtocol
extension DefaultFilterViewModel {
    func radioButtonTapped(model: PostFiltersModel) {
        switch model.filterType {
            case .period:
                self.sharedViewModel?.periodSelected = model.filterValue
            case .postType:
                self.sharedViewModel?.postTypeSelected = model.filterValue
                self.sharedViewModel?.sharedTypeSelected = model.filterName == "Most Shared" ? "facebook" : ""
            case .mostSharedType:
                self.sharedViewModel?.sharedTypeSelected = "facebook"
        }
    }
}

// MARK: - CheckBoxFiltersCellProtocol
extension DefaultFilterViewModel {
    func checkBoxSelected(model: PostFiltersModel, isSelected: Bool) {
        // I think NYC API it only uses facebook as shared type, so I am not using this feature
        if case .mostSharedType = model.filterType {
            if isSelected {
                // Add filter in array
            } else {
                // Remove filter in array
            }
        }
    }
}
