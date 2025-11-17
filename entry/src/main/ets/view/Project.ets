import http from '@ohos.net.http'
import { ProjectItem, ProjectItemResponse } from '../viewModel/ProjectItem'

/**
 * 2.试验项目列表返回值
 */
@Component
export default struct Project {
  @State message: string = ''

  getProject() {
    let httpRequest = http.createHttp()
    httpRequest.request('http://192.168.31.95:18223/ddjc/project/listProvide',
      { method: http.RequestMethod.GET },
      (err, data) => {
        if (err) {
          this.message = JSON.stringify(err)
        } else if (data.responseCode != 200) {
          this.message = data.responseCode + ''
        } else {
          this.message = JSON.parse(data.result.toString()).msg
          console.log(this.message)
          let response: ProjectItemResponse = JSON.parse(data.result.toString())
          let projectList = response.data.map(item => ({
            searchValue: item.searchValue,
            createBy: item.createBy,
            createTime: item.createTime,
            updateBy: item.updateBy,
            updateTime: item.updateTime,
            remark: item.remark,
            params: item.params,
            projectId: item.projectId,
            projectName: item.projectName,
            projectAlias: item.projectAlias,
            code: item.code,
            delFlag: item.delFlag,
            dtProjectStandardList: item.dtProjectStandardList,
            categoryId: item.categoryId,
            categoryCode: item.categoryCode,
            standardString: item.standardString
          } as ProjectItem))
          console.log(projectList[1].projectName)
          this.message = projectList.map(item => item.projectName).join('\n')
        }
      })
  }

  build() {
    Column({ space: 5 }) {
      Text('2.试验项目列表返回值')
        .width('100%')

      Text(this.message)
        .border({ width: 1 })
        .height('80%')
        .width('100%')
        .align(Alignment.TopStart)

      Button('发送请求')
        .width('100%')
        .onClick(() => {
          this.getProject()
        })
    }
    .justifyContent(FlexAlign.Center)
    .padding({ left: '20vp', right: '20vp' })
    .height('100%')
    .width('100%')
  }
}