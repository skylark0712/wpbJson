/**
 * 1.设备类别列表返回值
 */
export interface CategoryItemResponse {
  msg: string
  code: string
  data: CategoryItem[]
}

export interface CategoryItem {
  searchValue: number
  /**
   * 创建人
   */
  createBy: string
  /**
   * 创建时间
   */
  createTime: string
  /**
   * 修改人
   */
  updateBy: string
  /**
   * 修改时间
   */
  updateTime: string
  /**
   * 备注
   */
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
  /**
   * 删除标识，0-未删除，1-已删除
   */
  delFlag: number
}