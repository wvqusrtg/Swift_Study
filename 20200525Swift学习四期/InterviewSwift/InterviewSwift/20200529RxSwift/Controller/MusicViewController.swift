//
//  MusicViewController.swift
//  InterviewSwift
//
//  Created by nixs on 2020/5/29.
//  Copyright © 2020 nixs. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

class MusicViewController: BaseViewController {
    //tableView对象
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        //设置代理
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    //歌曲列表数据源
    let musicListViewModel = MusicListViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "歌曲信息"
        initView()
        
    }
    func initView() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension MusicViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicListViewModel.data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell")!
        let music = musicListViewModel.data[indexPath.row]
        cell.textLabel?.text = music.name
        cell.detailTextLabel?.text = music.singer
        return cell
    }
}

extension MusicViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("你选中的歌曲信息【\(musicListViewModel.data[indexPath.row])】")
    }
}
