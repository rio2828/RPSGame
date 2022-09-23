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
    
    // 가위바위보 게임(비즈니스 로직) 관리 위한 인스턴스
    var rpsManager = RPSManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        // 1) 첫번째/두번째 이미지뷰에 준비(묵) 이미지를 띄우기
        comImageView.image = rpsManager.getReady().rpsInfo.image
        myImageView.image = rpsManager.getReady().rpsInfo.image
        
        // 2) 첫번째/두번째 레이블에 "준비"라고 문자열 띄우기
        comChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        myChoiceLabel.text = rpsManager.getReady().rpsInfo.name
    }
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위,바위,보를 선택해서 정보를 저장해야됨
        guard let title = sender.currentTitle else { return }
        rpsManager.userGetSelected(name: title)
        myImageView.image = rpsManager.getUserRPS().rpsInfo.image
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터 랜덤 선택을 이미지뷰와 레이블에 표시
        comImageView.image = rpsManager.getComputerRPS().rpsInfo.image
        comChoiceLabel.text = rpsManager.getComputerRPS().rpsInfo.name
        
        // 2) 내 선택을 이미지뷰와 레이블에 표시
        myImageView.image = rpsManager.getUserRPS().rpsInfo.image
        myChoiceLabel.text = rpsManager.getUserRPS().rpsInfo.name
        
        // 3) 비교하여 승패 판단
        mainLabel.text = rpsManager.getRpsResult()
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터 선택 리셋
        comImageView.image = rpsManager.getReady().rpsInfo.image
        comChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        
        
        // 2) 내 선택 리셋
        myImageView.image = rpsManager.getReady().rpsInfo.image
        myChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        
        // 3) 메인 레이블 변경
        mainLabel.text = "선택하세요"
        
        // 4) 컴퓨터가 다시 랜덤 선택 & 저장
        rpsManager.allReset()
    }
    
    
    
    

}


