import UIKit
import SnapKit

class ViewController: UIViewController {
    let apiManager = APIManager()

    let monthLabel = UILabel()
    let dayLabel = UILabel()
    let riceTypeLabel = UILabel()
    let riceIdLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        apiManager.fetchRiceMenu { [weak self] riceMenu in
            guard let riceMenu = riceMenu else {
                print("Error fetching rice menu")
                return
            }

            DispatchQueue.main.async {
                self?.updateUI(with: riceMenu)
                self?.view.backgroundColor = .red
            }
        }
    }

    private func setupUI() {
        view.addSubview(monthLabel)
        view.addSubview(dayLabel)
        view.addSubview(riceTypeLabel)
        view.addSubview(riceIdLabel)

        monthLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
        }

        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(monthLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }

        riceTypeLabel.snp.makeConstraints { make in
            make.top.equalTo(dayLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }

        riceIdLabel.snp.makeConstraints { make in
            make.top.equalTo(riceTypeLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
    }

    private func updateUI(with riceMenu: RiceMenu) {
        monthLabel.text = "Month: \(riceMenu.month)"
        dayLabel.text = "Day: \(riceMenu.day)"
        riceTypeLabel.text = "Rice Type: \(riceMenu.riceType)"
        riceIdLabel.text = "Rice ID: \(riceMenu.riceId)"
    }
}
