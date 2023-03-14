import UIKit

class ViewController: UIViewController {
    
    let images = ["swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift","swift",]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ViewController: UICollectionViewDelegate {

    //cell 클릭했을 때 이벤트
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    // 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let collectionViewCellWithd = collectionView.frame.width / 3 - 1
        return CGSize(width: collectionViewCellWithd, height: collectionViewCellWithd)
    }

    //위아래 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //옆 라인 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //이미지 카운터 하는 함수
        return images.count
    }
    
    //셀 구성하기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowCell", for: indexPath) as! CustomCell
        cell.image.image = UIImage(named: images[indexPath.row])
        return cell
    }
}
