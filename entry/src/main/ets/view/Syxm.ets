/**
 * 2.试验项目列表返回值
 */
@Component
export default struct Syxm {
  build() {
    Column({ space: 5 }) {
      Text('2.试验项目列表返回值')
        .width('100%')

      Text()
        .border({ width: 1 })
        .height('80%')
        .width('100%')

      Button('发送请求')
        .width('100%')
    }
    .justifyContent(FlexAlign.Center)
    .padding({ left: '20vp', right: '20vp' })
    .height('100%')
    .width('100%')
  }
}