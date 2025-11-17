export interface CategoryItemResponse {
  msg: string
  code: string
  data: CategoryItem[]
}

export interface CategoryItem {
  searchValue: number
  createBy: string
  createTime: string
  updateBy: string
  updateTime: string
  remark: string
  params: object
  /**
   * 设备类别主键
   */
  categoryId: number
  /**
   * 类别名称
   */
  categoryName: string
  /**
   * 类别顺序
   */
  categorySort: number
  /**
   * 编码
   */
  code: string
  delFlag: number
}