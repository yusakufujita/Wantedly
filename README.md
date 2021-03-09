# Wantedly(https://github.com/yusakufujita/Wantedly）

Wantedly様の提出用課題として、Wantedlyを作りました。


# DEMO

![RocketSim Recording - iPhone 11 - 2021-03-10 02 38 17](https://user-images.githubusercontent.com/48333289/110514321-87276100-814a-11eb-84d6-a70edc81e136.gif)

# 工夫したところ
## 使用したライブラリは、AlamofireとNukeです。Alamofireは、 HTTP(S)通信を実現するために用いました.<br>また、Nukeは、tableViewCellを滑らかに動かすために用いました。使用したアーキテクチャは、MVCモデルを用いました。また他に工夫したところは、storyboardをViewControllerごとに作り、mergeした時にconflictが起きにくい構造にしました。そして、githubのブランチ名は、master,develop,release,feature-1,hotfix-1をそれぞれ作り、チームでの開発を意識しました。
