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
    
    private var periodSelected: String = "1"
    private var postTypeSelected: String = "viewed"
    private var mostSharedSelected: String = ""
    // I think NYC API it only uses facebook as shared type, so I am not using this feature
    //private var mostSharedSelected: [String] = []
    
    init(sharedViewModel: SharedViewModel) {
        self.sharedViewModel = sharedViewModel
    }
    
    func viewDidLoad() {
        spinnerStatus.value = .start
        fetchFiltersModel()
    }
    
    func doneButtonTapped() {
        sharedViewModel?.fetchPosts(parameters: FetchPostsUseCaseParameters(postType: postTypeSelected,
                                                                            period: periodSelected,
                                                                            sharedType: mostSharedSelected))
    }
}

// MARK: - Private Methods
extension DefaultFilterViewModel {
    // TODO: Pasar los nombres y las values a una enum de constantes
    private func fetchFiltersModel() {
        postsPeriodFiltersModel.value = [
            PostFiltersModel(filterName: "1 día", filterType: .period, filterValue: "1"),
            PostFiltersModel(filterName: "7 días", filterType: .period, filterValue: "7"),
            PostFiltersModel(filterName: "30 días", filterType: .period, filterValue: "30")
        ]
        
        postsTypeFiltersModel.value = [
            PostFiltersModel(filterName: "Most Mailed", filterType: .postType, filterValue: "emailed"),
            PostFiltersModel(filterName: "Most Shared", filterType: .postType, filterValue: "shared"),
            PostFiltersModel(filterName: "Most Viewed", filterType: .postType, filterValue: "viewed")
        ]
        
        mostSharedFiltersModel.value = [
            PostFiltersModel(filterName: "Facebook", filterType: .mostSharedType, filterValue: "facebook"),
            PostFiltersModel(filterName: "Twitter", filterType: .mostSharedType, filterValue: "twitter")
        ]
        spinnerStatus.value = .stop
    }
}

// MARK: - RadioFiltersCellProtocol
extension DefaultFilterViewModel {
    func radioButtonTapped(model: PostFiltersModel) {
        switch model.filterType {
            case .period:
                self.periodSelected = model.filterValue
            case .postType:
                self.postTypeSelected = model.filterValue
            self.mostSharedSelected  = model.filterName == "Most Shared" ? "facebook" : ""
            case .mostSharedType:
                self.mostSharedSelected = "facebook"
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
