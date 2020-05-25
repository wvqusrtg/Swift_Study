//
//  QuizViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/5/25.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit

class QuizViewController: BaseViewController {
    /// Curent game state
    var state = State(questions: questions)
    
    /// Current question countdown timer
    var timer: Timer?

    // MARK: - Views
    lazy var viewProgress: UIView = {
      let v = UIView(frame: .zero)
      v.backgroundColor = .green
      
      view.addSubview(v)
      
      return v
    }()
    
    lazy var lblTimer: UILabel = {
      let lbl = UILabel(frame: .zero)
      lbl.layer.cornerRadius = 8
      lbl.layer.borderColor = UIColor.black.cgColor
      lbl.layer.borderWidth = 2
      lbl.textAlignment = .center
      lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
      lbl.text = "00:10"
      
      view.addSubview(lbl)
      
      return lbl
    }()
    
    lazy var lblQuestion: UILabel = {
      let lbl = UILabel(frame: .zero)
      lbl.textAlignment = .center
      lbl.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
      lbl.text = "Question placeholder"
      lbl.numberOfLines = 0
      
      view.addSubview(lbl)
      
      return lbl
    }()
    
    lazy var btnTrue: UIButton = {
      let btn = UIButton(type: .custom)
      btn.layer.cornerRadius = 12
      btn.backgroundColor = .green
      btn.setTitle("👍True", for: .normal)
      btn.setTitleColor(.black, for: .normal)
      btn.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
      btn.showsTouchWhenHighlighted = true
      btn.addTarget(self, action: #selector(handleAnswer(_:)), for: .touchUpInside)
      
      return btn
    }()
    
    lazy var btnFalse: UIButton = {
      let btn = UIButton(type: .custom)
      btn.layer.cornerRadius = 12
      btn.backgroundColor = .red
      btn.setTitle("👎False", for: .normal)
      btn.setTitleColor(.black, for: .normal)
      btn.titleLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
      btn.showsTouchWhenHighlighted = true
      btn.addTarget(self, action: #selector(handleAnswer(_:)), for: .touchUpInside)
      
      return btn
    }()
    
    lazy var svButtons: UIStackView = {
      let stackView = UIStackView(arrangedSubviews: [btnFalse, btnTrue])
      stackView.alignment = .center
      stackView.spacing = 16
      stackView.axis = .horizontal
      stackView.distribution = .fillEqually
      
      view.addSubview(stackView)
      
      return stackView
    }()
    
    lazy var lblMessage: UILabel = {
      let lbl = UILabel(frame: .zero)
      lbl.numberOfLines = 0
      lbl.backgroundColor = UIColor.black.withAlphaComponent(0.8)
      lbl.textAlignment = .center
      lbl.font = UIFont.systemFont(ofSize: 48, weight: .semibold)
      lbl.alpha = 0
      
      self.navigationController?.view.addSubview(lbl)
      
      return lbl
    }()
    
    // - MARK: Setup
    override func viewDidLoad() {
      super.viewDidLoad()
      
//      navigationItem.largeTitleDisplayMode = .always
//      navigationController?.navigationBar.prefersLargeTitles = true
//      navigationController?.navigationBar.barTintColor = UIColor(red: 1, green: 108.0/255, blue: 0, alpha: 1.0)
//      navigationController?.navigationBar.isTranslucent = false
      
      setupConstraints()
      startGame()
    }

}
extension QuizViewController{
    func setupConstraints() {
      updateProgress(to: 0)
      
      lblTimer.snp.makeConstraints { make in
        make.width.equalToSuperview().multipliedBy(0.45).labeled("timerWidth")
        make.height.equalTo(45).labeled("timerHeight")
        make.top.equalTo(viewProgress.snp.bottom).offset(32).labeled("timerTop")
        make.centerX.equalToSuperview().labeled("timerCenterX")
      }
      
      lblQuestion.snp.makeConstraints { make in
        make.top.equalTo(lblTimer.snp.bottom).offset(24)
        make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
      }
      
      lblMessage.snp.makeConstraints { make in
        make.edges.equalToSuperview()
      }
      
      svButtons.snp.makeConstraints { make in
        make.leading.trailing.equalTo(lblQuestion)
        make.top.equalTo(lblQuestion.snp.bottom).offset(16)
        make.height.equalTo(80)
      }
    }
    
    func updateProgress(to progress: Double) {
      viewProgress.snp.remakeConstraints { make in
        make.top.equalTo(view.safeAreaLayoutGuide)
        make.width.equalToSuperview().multipliedBy(progress)
        make.height.equalTo(32)
        make.leading.equalToSuperview()
      }
    }
}
extension QuizViewController{
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
      super.willTransition(to: newCollection, with: coordinator)
      // 1
      let isPortrait = UIDevice.current.orientation.isPortrait
      
      // 2
      lblTimer.snp.updateConstraints { make in
        make.height.equalTo(isPortrait ? 45 : 65)
      }
      
      // 3
      lblTimer.font = UIFont.systemFont(ofSize: isPortrait ? 20 : 32, weight: .light)
    }
}
extension QuizViewController{
    @objc func handleAnswer(_ sender: UIButton) {
      let userSelection = sender == btnTrue
      let isCorrect = state.question.isTrue == userSelection
      
      if isCorrect {
        state.correctAnswers += 1
      }
      
      showMessage(isCorrect: isCorrect)
    }
    
    func showMessage(isCorrect: Bool) {
      lblMessage.text = isCorrect ? "That's correct!\n👍🎉😄" : "Sorry, that's wrong!\n\n👎☠️😢"
      lblMessage.textColor = isCorrect ? .green : .red
      lblMessage.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
      lblMessage.alpha = 0
      timer?.invalidate()
      
      UIView.animate(withDuration: 0.7,
                     delay: 0.0,
                     usingSpringWithDamping: 0.4,
                     initialSpringVelocity: 0.8,
                     options: .curveEaseIn,
                     animations: {
                      self.lblMessage.alpha = 1
                      self.lblMessage.transform = .identity
                     },
                     completion: { _ in
                      UIView.animate(withDuration: 0.15,
                                     delay: 0.35,
                                     animations: {
                                      self.lblMessage.alpha = 0
                                     },
                                     completion: { _ in
                                      self.goToNextQuestion()
                                     })
                     })
    }
    
    func goToNextQuestion() {
      guard !state.isLastQuestion else {
        // This is the last question
        let alert = UIAlertController(title: "Good job!",
                                      message: "You got \(state.correctAnswers) out of \(state.numberOfQuestions) right.",
          preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Start Over",
                                      style: .default,
                                      handler: { [weak self] _ in self?.startGame() }))
        
        present(alert, animated: true, completion: nil)
        return
      }
      
      goToQuestion(at: state.currentQuestion + 1)
    }
    
    func goToQuestion(at position: Int) {
      state.currentQuestion = position
      
      lblQuestion.text = state.question.title
      navigationItem.title = "SnappyQuiz \(position)/\(state.numberOfQuestions)"
      
      let progress = Double(position) / Double(state.numberOfQuestions)
      updateProgress(to: progress)
      startCountdown()
    }
    
    func startGame() {
      state = State(questions: questions)
      goToQuestion(at: 1)
    }
    
    func startCountdown() {
      lblTimer.text = "00:10"
      
      timer?.invalidate()
      timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
        guard let self = self else { return }
        
        let currentSeconds = Int((self.lblTimer.text ?? "0").replacingOccurrences(of: ":", with: "")) ?? 1
        
        guard currentSeconds > 1 else {
          timer.invalidate()
          self.goToNextQuestion()
          return
        }
        
        self.lblTimer.text = "00:0\(currentSeconds - 1)"
      }
    }
}
extension QuizViewController{
    struct State {
      let questions: [Question]
      let numberOfQuestions: Int
      var currentQuestion: Int
      var correctAnswers: Int
      
      init(questions: [Question]) {
        self.questions = questions
        numberOfQuestions = questions.count
        currentQuestion = 1
        correctAnswers = 0
      }
      
      var isLastQuestion: Bool {
        return currentQuestion == numberOfQuestions
      }
      
      var question: Question {
        return questions[currentQuestion - 1]
      }
    }
}
