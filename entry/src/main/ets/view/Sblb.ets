import http from '@ohos.net.http'
import { CategoryItem, CategoryItemResponse } from '../viewModel/CategoryItem'

/**
 * 1.设备类别列表返回值
 */
@Component
export default struct Sblb {
  @State message: string = ''

  getSblb() {
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
            categoryId: item.categoryId,
            categoryName: item.categoryName
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
          this.getSblb()
        })
    }
    .justifyContent(FlexAlign.Center)
    .padding({ left: '20vp', right: '20vp' })
    .height('100%')
    .width('100%')
  }
}