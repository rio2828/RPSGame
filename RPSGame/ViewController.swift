//
//  ViewController.swift
//  RPSGame
//
//  Created by 김태현 on 2022/02/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    var myChoice: Rps = Rps.rock
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 첫번째/두번째 이미지뷰에 준비 이미지
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        
        // 첫번째/두번째 이미지 레이블에 "준비" 텍스트
        comChoiceLabel.text = "준비"
        comChoiceLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        myChoiceLabel.text = "준비"
        myChoiceLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    }
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위,바위,보를 선택해서 정보를 저장해야됨
//        guard let title = sender.currentTitle else {
//            return
//        }
        let title = sender.currentTitle!
        
        
        switch title {
        case "가위":
            myChoice = Rps.scissors
//            print("가위")
        case "바위":
            myChoice = Rps.rock
//            print("바위")
        case "보":
            myChoice = Rps.paper
//            print("보")
        default:
            break
            
        }
        
        switch myChoice {
        case Rps.rock:
            
            myImageView.image = #imageLiteral(resourceName: "ready")
            myChoiceLabel.text = "바위"
        case Rps.paper:

            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case Rps.scissors:

            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        default:
            break
        }
        
       
        
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        
        // 1) 컴퓨터 선택한 이미지가 이미지뷰에 표시
        switch comChoice {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        
        }
        
        // 2) 컴퓨터 랜덤 선택한 것을 이미지 레이블
        // 3) 내 선택 이미지뷰
        // 4) 내 선택 레이블
        
        switch myChoice {
        case Rps.rock:
            
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case Rps.paper:

            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case Rps.scissors:

            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        default:
            break
        }
        
        

        // 5) 컴퓨터가 선택한 것과 내 선택을 비교 -> 이김/짐 판단
            if comChoice == myChoice {
                mainLabel.text = "비겼습니다."
            } else if comChoice == .rock && myChoice == .paper {
                mainLabel.text = "이겼습니다."
            } else if comChoice == .scissors && myChoice == .rock {
                mainLabel.text = "이겼습니다."
            } else if comChoice == .paper && myChoice == .scissors {
                mainLabel.text = "이겼습니다."
            } else {
                mainLabel.text = "졌습니다."
            }
                
            
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터 다시 준비 이미지
        // 2) 컴퓨터 다시 준비 레이블
        // 3) 내 준비 이미지뷰
        // 4) 내 레이블 "준비" 텍스트
        
        // 첫번째/두번째 이미지뷰에 준비 이미지
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = #imageLiteral(resourceName: "ready")
        
        // 첫번째/두번째 이미지 레이블에 "준비" 텍스트
        comChoiceLabel.text = "준비"
        comChoiceLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        myChoiceLabel.text = "준비"
        myChoiceLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        
        
        
        
        // 5) 메인레이블 "선택하세요"
        
        mainLabel.text = "선택하세요"
        
        
        // 6) 컴퓨터가 다시 랜덤 가위/바위/보 선택, 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
    
    
    
    

}


