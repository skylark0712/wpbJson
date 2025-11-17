/**
 * 4.任务列表返回值
 */
@Component
export default struct Rwlb {
  build() {
    Column({ space: 5 }) {
      Text('4.任务列表返回值')
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