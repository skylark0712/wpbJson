/**
 * 4.任务列表返回值
 */
export interface TaskItemResponse {
  total: number
  rows: TaskItem[]
  code: number,
  msg: string
}

/**
 * 5.任务详细信息返回值
 */
export interface TaskEquipmentResponse {
  msg: string
  code: number
  data: TaskItem
}

export interface TaskItem {
  searchValue: number
  createBy: string
  createTime: string
  updateBy: string
  updateTime: string
  remark: string
  params: object
  /**
   * 检测任务主键
   */
  taskId: number
  /**
   * 任务名称
   */
  taskName: string
  /**
   * 任务编号
   */
  taskNo: string
  /**
   * 委托单位
   */
  taskUnit: string
  /**
   * 站线名称
   */
  taskStation: string
  /**
   * 负责人
   */
  taskCharge: string
  /**
   * 委托日期
   */
  taskEntrustDate: string
  /**
   * 任务状态
   */
  taskStatus: string
  /**
   * 委托日期开始时间
   */
  entrustDateStart: string
  /**
   * 委托日期结束时间
   */
  entrustDateEnd: string
  /**
   * 人员主键
   */
  userIds: string
  /**
   * 人员名称
   */
  userNames: string
  taskStatusProvide: string
  dtTaskEquipmentList: dtTaskEquipment[]
  delFlag: number
}

interface dtTaskEquipment {
  searchValue: number
  createBy: string
  createTime: string
  updateBy: string
  updateTime: string
  remark: string
  params: object
  /**
   * 任务设备基础信息表主键
   */
  taskEquipmentId: number
  /**
   * 设备类别编码
   */
  categoryCode: string
  /**
   * 设备类别名称
   */
  categoryName: string
  /**
   * 设备数量
   */
  equipmentNumber: number
  /**
   * 关联项目编码
   */
  projectCodes: string
  /**
   * 关联项目名称
   */
  projectNames: string
  /**
   * 任务管理主键
   */
  taskId: number
}