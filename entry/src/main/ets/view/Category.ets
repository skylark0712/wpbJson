import http from '@ohos.net.http'
import { CategoryItem, CategoryItemResponse } from '../viewModel/CategoryItem'

/**
 * 1.设备类别列表返回值
 */
@Component
export default struct Category {
  @State message: string = ''

  getCategory() {
    let httpRequest = http.createHttp()
    httpRequest.request('http://192.168.31.95:18223/ddjc/category/listProvide',
      { method: http.RequestMethod.GET },
      (err, data) => {
        if (err) {
          this.message = JSON.stringify(err)
        } else if (data.responseCode != 200) {
          this.message = data.responseCode + ''
        } else {
          this.message = JSON.parse(data.result.toString()).msg
          console.log(this.message)
          let response: CategoryItemResponse = JSON.parse(data.result.toString())
          let categoryList = response.data.map(item => ({
            searchValue: item.searchValue,
            createBy: item.createBy,
            createTime: item.createTime,
            updateBy: item.updateBy,
            updateTime: item.updateTime,
            remark: item.remark,
            params: item.params,
            categoryId: item.categoryId,
            categoryName: item.categoryName,
            categorySort: item.categorySort,
            code: item.code,
            delFlag: item.delFlag
          } as CategoryItem))
          console.log(categoryList[1].categoryName)
          this.message = categoryList.map(item => item.categoryName).join('\n')
        }
      })
  }

  build() {
    Column({ space: 5 }) {
      Text('1.设备类别列表返回值')
        .width('100%')

      Text(this.message)
        .border({ width: 1 })
        .height('80%')
        .width('100%')
        .align(Alignment.TopStart)

      Button('发送请求')
        .width('100%')
        .onClick(() => {
          this.getCategory()
        })
    }
    .justifyContent(FlexAlign.Center)
    .padding({ left: '20vp', right: '20vp' })
    .height('100%')
    .width('100%')
  }
}