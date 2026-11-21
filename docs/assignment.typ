= 编程基础课程作业

姓名：孙思瑄

== VS Code 配置
记录如何配置 VS Code。

首先在群里面下载老师发的`vscode-profile.json`到桌面，然后打开VS Code，点击左下角的Setting→Profile→Profiles→New Profile→右侧小箭头点开选择Import Profile→选择下载好的`vscode-profile.json`→选择Import。

出现的问题：Profile应用不成功。

原因：由于import的时候选择了extension,而部分插件下载超时导就是致Profile一直安装失败

解决方法：Import时取消勾选extension.之后通过老师提供的安装小助手成功当时没安装的插件.

== Typst 配置
记录如何安装Typst插件。

直接在extensions里搜索Tinymist Typst并下载即可.

== R 语言代码管理
记录如何克隆R包

点击老师发的链接，进入GitHub仓库页面，依次点击Use this template→ Repository name → Create a new repository，将仓库模板应用到到自己的GitHub账号下的仓库中。然后在自己GitHub账号下的仓库页面点击绿色的Code按钮，复制HTTPS链接。之后在本地终端中输入`git clone` + 复制的链接，即可将仓库克隆到本地。

== 环境设置
记录如何配置 Git、登录 GitHub、连接 Pi 和 VS Code。

首先进入个人目录，编辑`.envrc`文件，将文件中的代码复制粘贴到`.envrc`文件并修改路径。之后在终端中输入文档所给指令配置git用户名和邮箱，然后在终端中输入指令登录github账号。接着在Extension搜索安装`vscode-pi-bridge` 插件，并下载`pi-vscode-context.ts`文件复制到`PI_CODING_AGENT_DIR/extensions/`目录下，最后重启vscode


问题：在安装好`vscode-pi-bridge`插件并下载好将`pi-vscode-context.ts`后我试图在终端里通过指令`mkdir -p "PI_CODING_AGENT_DIR/extensions"`来生成`PI_CODING_AGENT_DIR/extensions/`目录却返回denied

原因：没有权限创建`PI_CODING_AGENT_DIR/extensions/`目录

解决方法：直接在左侧目录里新建了extensions文件夹,之后就顺利的完成了Pi和 VS Code的连接.

#pagebreak()

== R 包实战
记录仓库地址、添加的函数、测试用了什么输入，以及得到的结果。

实战中第一步的克隆与前面模板的使用完全相同.之后函数的添加,我首先点击老师发的文档里的链接将函数文件下载下来然后直接拖入R/中,命名为`Component.R`,然后让ai读取了函数文件,让其生成typst说明文件放在docs/中,命名为`component.typ`,同时生成测试代码于`tests/testthat/`中,命名为`test_component.R`.测试代码中我让ai提供的输入,并在本地运行了测试代码,结果显示全部通过.之后我将代码push到GitHub上,并在GitHub Actions上运行了测试代码.

问题：第一次上传R-CMD-check显示通过,pkgdown与test-coverage报错

原因：其中pkgdown报错的原因是无`gh-pages`分支，`GITHUB_TOKEN`默认只读，无法创建/推送,`pkgdown.yaml` 加 `permissions: contents:write`并在GitHub上的Settings→Actions→General→Workflow permissions选Read and write将问题解决.而test-coverage报错则是codecov拿不到该项目凭据——仓库未在codecov.io激活，或`CODECOV_TOKEN` secret缺失/失效,导致无法上传覆盖率报告。

解决方法：去codecov.io激活该项目，并在GitHub上添加`CODECOV_TOKEN` secret.之后再次push代码到GitHub上.
