import Foundation
import UIKit

extension MainViewController {
    
     func showCityAlert(with completion: @escaping (String) -> Void) {
         let alertVC = UIAlertController(title: "Choose City",
                                         message: nil,
                                         preferredStyle: .alert)
         alertVC.addTextField { textField in
             textField.placeholder = "City Name"
         }
        
         let allertAction = UIAlertAction(title: "Find", style: .default) { UIAlertAction in
             let firstTextField = alertVC.textFields![0] as UITextField
             guard let cityName = firstTextField.text else { return }
             completion(cityName)
         }
        
         let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
         alertVC.addAction(allertAction)
         alertVC.addAction(cancelAction)
        
         self.present(alertVC, animated: true)
     }
 }

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return weatherModel?.list.count ?? 0
     }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForecastCollectionViewCell", for: indexPath) as? ForecastCollectionViewCell,
             let cellModel = weatherModel?.list[indexPath.row]
         else {
             return UICollectionViewCell()
         }
        
         cell.configure(with: cellModel)
         return cell
     }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: 50, height: 50)
     }
}
