import http from '@ohos.net.http'
import { TaskItem, TaskItemResponse } from '../viewModel/TaskItem'

/**
 * 4.任务列表返回值
 */
@Component
export default struct Task {
  @State message: string = ''

  getTask() {
    let httpRequest = http.createHttp()
    httpRequest.request('http://192.168.31.95:18223/ddjc/task/listProvide',
      { method: http.RequestMethod.GET },
      (err, data) => {
        if (err) {
          this.message = JSON.stringify(err)
        } else if (data.responseCode != 200) {
          this.message = data.responseCode + ''
        } else {
          this.message = JSON.parse(data.result.toString()).msg
          console.log(this.message)
          let response: TaskItemResponse = JSON.parse(data.result.toString())
          let taskList = response.rows.map(item => ({
            searchValue: item.searchValue,
            createBy: item.createBy,
            createTime: item.createTime,
            updateBy: item.updateBy,
            updateTime: item.updateTime,
            remark: item.remark,
            params: item.params,
            taskId: item.taskId,
            taskName: item.taskName,
            taskNo: item.taskNo,
            taskUnit: item.taskUnit,
            taskStation: item.taskStation,
            taskCharge: item.taskCharge,
            taskEntrustDate: item.taskEntrustDate,
            taskStatus: item.taskStatus,
            entrustDateStart: item.entrustDateStart,
            entrustDateEnd: item.entrustDateEnd,
            userIds: item.userIds,
            userNames: item.userNames,
            taskStatusProvide: item.taskStatusProvide,
            dtTaskEquipmentList: item.dtTaskEquipmentList,
            delFlag: item.delFlag
          } as TaskItem))
          console.log(taskList[0].userNames)
          this.message = taskList.map(item => item.userNames).join('\n')
        }
      })
  }

  build() {
    Column({ space: 5 }) {
      Text('4.任务列表返回值')
        .width('100%')

      Text(this.message)
        .border({ width: 1 })
        .height('80%')
        .width('100%')
        .align(Alignment.TopStart)

      Button('发送请求')
        .width('100%')
        .onClick(() => {
          this.getTask()
        })
    }
    .justifyContent(FlexAlign.Center)
    .padding({ left: '20vp', right: '20vp' })
    .height('100%')
    .width('100%')
  }
}