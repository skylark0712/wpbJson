export interface TaskItemResponse {
  total: number
  rows: TaskItem[]
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

}