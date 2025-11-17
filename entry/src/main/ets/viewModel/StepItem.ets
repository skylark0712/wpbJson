export interface StepItemResponse {
  msg: string
  code: string
  data: StepItem[]
}

export interface StepItem {
  /**
   * 主键
   */
  stepId: number
  /**
   * 试验项目编码
   */
  projectCode: string
  /**
   * 试验项目名称
   */
  projectName: string
  /**
   * 设备类别
   */
  categoryCode: string
  /**
   * 设备名称
   */
  categoryName: string
  /**
   * 试验项目检测标准
   */
  projectStandardChildrenList: []
  /**
   * 试验步骤检测位置
   */
  stepStandardChildrenList: StepStandardChild[]
}

interface StepStandardChild {
  standardName: string
}