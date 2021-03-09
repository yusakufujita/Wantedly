# Wantedly(https://github.com/yusakufujita/Wantedly）

Wantedly様のインターンの提出用課題として、Wantedlyを作りました。


# DEMO
![RocketSim Recording - iPhone 11 - 2021-03-10 06 47 25](https://user-images.githubusercontent.com/48333289/110542888-f6ae4800-816c-11eb-8d0e-c3e15930353f.gif)


# 工夫したところ
## 使用したライブラリは、AlamofireとNukeです。Alamofireは、 HTTP(S)通信を実現するために用いました.<br>また、Nukeは、tableViewCellを滑らかに動かすために用いました。使用したアーキテクチャは、MVCモデルを用いました。また他に工夫したところは、storyboardをViewControllerごとに作り、mergeした時にconflictが起きにくい構造にしました。そして、githubのブランチ名は、master,develop,release,feature-1,hotfix-1をそれぞれ作り、チームでの開発を意識しました。
