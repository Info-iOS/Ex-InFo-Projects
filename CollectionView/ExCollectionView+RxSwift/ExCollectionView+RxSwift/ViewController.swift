import UIKit
import RxCocoa
import RxRelay
import RxSwift
import Then
import SnapKit

class ViewController: UIViewController {
    
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    var array = ["0","1","2","3","4","5","6","7","8","9","10"]
    let disposeBag = DisposeBag()
    
    var collectionView : UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        layout.sectionInset = .zero
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        
        cv.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = nil
        collectionView.delegate = self
        
        let data = Observable<[String]>.of(self.array)
        
        data.asObservable()
            .bind(to: self.collectionView.rx
                .items(cellIdentifier: CustomCell.identifier, cellType: CustomCell.self)
            ) { index, recommend, cell in
                cell.layout()
                print("추가 collectionView 잘되고 있습니다")
                
                switch index {
                    case 0:
                        cell.text = "1"
                    case 1:
                        cell.text = "2"
                    case 2:
                        cell.text = "3"
                    case 3:
                        cell.text = "4"
                    case 4:
                        cell.text = "5"
                    case 5:
                        cell.text = "6"
                    case 6:
                        cell.text = "7"
                    case 7:
                        cell.text = "8"
                    default:
                        cell.text = "9"
                }
            }.disposed(by: disposeBag)
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }


}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 30) / 2
      return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


