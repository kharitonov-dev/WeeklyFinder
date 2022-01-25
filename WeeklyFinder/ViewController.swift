import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var mouthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dateTF.text, let mouth = mouthTF.text, let year = yearTF.text else {
            return
        }
        
        // Компоненты, где будем собирать даты и календарь
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(mouth)
        dateComponents.year = Int(year)
        
        // Объект с помощьб которо будем находить дату
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "EEEE"
        
        // Проверяю что могу получить дату
        guard let date = calendar.date(from: dateComponents) else {
            return
        }
        
        // Вставляю дату и нахожу название
        let weekDay = dateFormatter.string(from: date)
        let capitalizedWeekday = weekDay.capitalized
    
        resultLabel.text = capitalizedWeekday
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
