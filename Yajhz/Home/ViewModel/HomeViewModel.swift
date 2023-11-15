//
//  Home_VM.swift
//  Yajhz
//
//  Created by MAC on 15/11/2023.
//

import Foundation

class HomeViewModel{
    
    //MARK: - Properties
    var bindCategoriesToView : (()->()) = {}
    var bindPopularToView : (()->()) = {}
    
    var myCategoriesList = [Category()]{
        didSet{
            bindCategoriesToView()
        }
    }
    var myResturantsList = [Popular()]{
        didSet{
            bindPopularToView()
        }
    }
    private var networkInstance : NetworkManagerProtocol!
        
    init(networkInstance: NetworkManagerProtocol!){
           self.networkInstance = networkInstance
    }
    
    //MARK: - Methods
    func getCategories(url:URL){
        networkInstance.fetchData(url: url) { [weak self] (root: ResponseCategory?, err) in
            guard let root = root else { return }
            self?.myCategoriesList = root.data
        }
    }
    
    func getData(url:URL){
        networkInstance.fetchData(url: url) { [weak self] (root: ResponsePopular?, err) in
            guard let root = root else { return }
            self?.myResturantsList = root.data
        }
    }
    
}
