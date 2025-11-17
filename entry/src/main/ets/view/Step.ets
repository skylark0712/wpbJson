import http from '@ohos.net.http'
import { StepItem, StepItemResponse } from '../viewModel/StepItem'

/**
 * 3.设备对应分类关系
 */
@Component
export default struct Step {
  @State message: string = ''

  getStep() {
    let httpRequest = http.createHttp()
    httpRequest.request('http://192.168.31.95:18223/ddjc/step/listProvide',
      { method: http.RequestMethod.GET },
      (err, data) => {
        if (err) {
          this.message = JSON.stringify(err)
        } else if (data.responseCode != 200) {
          this.message = data.responseCode + ''
        } else {
          this.message = JSON.parse(data.result.toString()).msg
          console.log(this.message)
          let response: StepItemResponse = JSON.parse(data.result.toString())
          let stepList = response.data.map(item => ({
            stepId: item.stepId,
            projectCode: item.projectCode,
            projectName: item.projectName,
            categoryCode: item.categoryCode,
            categoryName: item.categoryName,
            projectStandardChildrenList: item.projectStandardChildrenList,
            stepStandardChildrenList: item.stepStandardChildrenList
          } as StepItem))
          console.log(stepList[0]?.stepStandardChildrenList[0]?.standardName ?? '/')
          this.message = stepList.map(item => item.stepStandardChildrenList[0]?.standardName ?? '/').join('\n')
        }
      })
  }

  build() {
    Column({ space: 5 }) {
      Text('3.设备对应分类关系')
        .width('100%')

      Text(this.message)
        .border({ width: 1 })
        .height('80%')
        .width('100%')
        .align(Alignment.TopStart)

      Button('发送请求')
        .width('100%')
        .onClick(() => {
          this.getStep()
        })
    }
    .justifyContent(FlexAlign.Center)
    .padding({ left: '20vp', right: '20vp' })
    .height('100%')
    .width('100%')
  }
}