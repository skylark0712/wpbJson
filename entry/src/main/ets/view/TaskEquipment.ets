import http from '@ohos.net.http'
import { TaskEquipmentResponse, TaskItem } from '../viewModel/TaskItem'

/**
 * 5.任务详细信息返回值
 */
@Component
export default struct TaskEquipment {
  @State message: string = ''
  @State taskId: string = '0'

  postTaskEquipment() {
    let httpRequest = http.createHttp()
    httpRequest.request('http://192.168.31.95:18223/ddjc/task/query',
      { method: http.RequestMethod.POST, extraData: `taskId=${this.taskId}` },
      (err, data) => {
        if (err) {
          this.message = JSON.stringify(err)
        } else if (data.responseCode != 200) {
          this.message = data.responseCode + ''
        } else {
          this.message = JSON.parse(data.result.toString()).msg
          console.log(this.message)
          let response: TaskEquipmentResponse = JSON.parse(data.result.toString())

          let taskItem: TaskItem = {
            searchValue: response.data?.searchValue || 0,
            createBy: response.data?.createBy || '',
            createTime: response.data?.createTime || '',
            updateBy: response.data?.updateBy || '',
            updateTime: response.data?.updateTime || '',
            remark: response.data?.remark || '',
            params: response.data?.params || null,
            taskId: response.data?.taskId || 0,
            taskName: response.data?.taskName || '',
            taskNo: response.data?.taskNo || '',
            taskUnit: response.data?.taskUnit || '',
            taskStation: response.data?.taskStation || '',
            taskCharge: response.data?.taskCharge || '',
            taskEntrustDate: response.data?.taskEntrustDate || '',
            taskStatus: response.data?.taskStatus || '',
            entrustDateStart: response.data?.entrustDateStart || '',
            entrustDateEnd: response.data?.entrustDateEnd || '',
            userIds: response.data?.userIds || '',
            userNames: response.data?.userNames || '',
            taskStatusProvide: response.data?.taskStatusProvide || '',
            dtTaskEquipmentList: response.data?.dtTaskEquipmentList || null,
            delFlag: response.data?.delFlag || 0
          }
          if (taskItem.dtTaskEquipmentList != null) {
            console.log(taskItem.dtTaskEquipmentList[0].projectNames)
            this.message = taskItem.dtTaskEquipmentList.map(item => item.projectNames).join('\n')
          } else {
            this.message = 'dtTaskEquipmentList为空'
          }
        }
      })
  }

  build() {
    Column({ space: 5 }) {
      Text('5.任务详细信息返回值')
        .width('100%')

      Text(this.message)
        .border({ width: 1 })
        .height('80%')
        .width('100%')
        .align(Alignment.TopStart)

      Row({ space: 5 }) {
        Text('taskId=')
          .textAlign(TextAlign.End)
          .layoutWeight(1)
        TextInput({ placeholder: '请输入33' })
          .textAlign(TextAlign.Center)
          .layoutWeight(1)
          .borderRadius(0)
          .onChange((value: string) => {
            this.taskId = value
          })
        Button('发送请求')
          .width('100%')
          .layoutWeight(1)
          .borderRadius(0)
          .onClick(() => {
            this.postTaskEquipment()
          })
      }
      .width('100%')

    }
    .justifyContent(FlexAlign.Center)
    .padding({ left: '20vp', right: '20vp' })
    .height('100%')
    .width('100%')
  }
}