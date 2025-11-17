/**
 * 3.设备对应分类关系
 */
@Component
export default struct Sbfl {
  build() {
    Column({ space: 5 }) {
      Text('3.设备对应分类关系')
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