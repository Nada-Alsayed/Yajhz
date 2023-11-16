//
//  Home_VC.swift
//  Yajhz
//
//  Created by MAC on 14/11/2023.
//

import UIKit
import Kingfisher



class Home_VC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var popularNowCollectionView: UICollectionView!
    @IBOutlet weak var trendingCollectionView: UICollectionView!
    
    
    //MARK: - Properties
    var categories : [Category] = []
    var resturants : [Popular] = []
    var viewModel = HomeViewModel(networkInstance: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsConfigurations()
        setUserName()
        bindCategories()
        bindResturants()
    }
    
    //MARK: - IBActions
    @IBAction func signOut(_ sender: Any) {
        AlertCreator().showAlertWithAction(title: "Alert!", titleAction: "Signout", titleNoAction: "No", message: "Are you sure you want to signout? ", viewController: self) {
            
            UserDefaults.standard.set("", forKey: ConstantsStrings.USER_NAME)
            
            let signInVC = self.storyboard?.instantiateViewController(withIdentifier: ConstantsStrings.SIHNIN_VC) as! SignIn_VC
            signInVC.modalPresentationStyle = .fullScreen
            self.present(signInVC, animated: true, completion: nil)
            
        }
    }
    
    //MARK: - Mrthods
    func setCellsConfigurations(){
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        popularNowCollectionView.delegate = self
        popularNowCollectionView.dataSource = self
        
        trendingCollectionView.delegate = self
        trendingCollectionView.dataSource = self
        
        categoriesCollectionView.register(UINib(nibName: ConstantsStrings.CELL_CATEGORIES, bundle: nil), forCellWithReuseIdentifier: ConstantsStrings.CELL_CATEGORIES)

        popularNowCollectionView.register(UINib(nibName: ConstantsStrings.CELL_POPULAR_NOW, bundle: nil), forCellWithReuseIdentifier: ConstantsStrings.CELL_POPULAR_NOW)
        
        trendingCollectionView.register(UINib(nibName: ConstantsStrings.CELL_TRENDING, bundle: nil), forCellWithReuseIdentifier: ConstantsStrings.CELL_TRENDING)
        
    }
    
    func bindCategories(){
        viewModel.bindCategoriesToView = { [weak self] in
            DispatchQueue.main.async {
                self?.categories = self?.viewModel.myCategoriesList ?? []
                self?.categoriesCollectionView.reloadData()
            }
        }
        
        viewModel.getCategories(url: URLCreator().getCategories())
    }
    
    func bindResturants(){
        viewModel.bindPopularToView = { [weak self] in
            DispatchQueue.main.async {
                self?.resturants = self?.viewModel.myResturantsList ?? []
                self?.popularNowCollectionView.reloadData()
                self?.trendingCollectionView.reloadData()
            }
        }
        viewModel.getData(url: URLCreator().getPopular())
    }
    
    func setUserName(){
        if let retrievedString = UserDefaults.standard.string(forKey: ConstantsStrings.USER_NAME) {
            print("Retrieved String: \(retrievedString)")
            helloLabel.text = "Hello " + retrievedString
        } else {
            print("No value found for key 'myStringKey'")
        }
    }
}

//MARK: - Extension to implemment coolectionView functions
extension Home_VC : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
            case 0:
                return categories.count
            case 1:
                return resturants.count
            case 2:
                return resturants.count
            default:
                return 0
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
            case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstantsStrings.CELL_CATEGORIES, for: indexPath) as! CategoriesCell
            
            cell.img.kf.setImage(with: URL(string: categories[indexPath.row].image))
            cell.categoryName.text = categories[indexPath.row].name
            return cell
            case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstantsStrings.CELL_POPULAR_NOW, for: indexPath) as! PopularNowCell
            cell.img.kf.setImage(with: URL(string: resturants[indexPath.row].image))
            cell.name.text = resturants[indexPath.row].name
            cell.distance.text = resturants[indexPath.row].distance
            let ratingString = resturants[indexPath.row].rate
                cell.configure(with: ratingString)
            cell.rate.text = resturants[indexPath.row].rate
            return cell
            case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ConstantsStrings.CELL_TRENDING, for: indexPath) as! TrendingNowCell
            cell.img.kf.setImage(with: URL(string: resturants[indexPath.row].logo))
            return cell
            default:
                fatalError("Unexpected collection view tag")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            return CGSize(width: 145, height: CGFloat(128))
        case 1 :
            return CGSize(width: 190, height: CGFloat(165))
        case 2 :
            return CGSize(width: 136, height: CGFloat(110))
        default :
            return CGSize(width: 0, height: CGFloat(0))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Specify the minimum spacing between cells
        switch collectionView.tag {
        default :
            return 50
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
