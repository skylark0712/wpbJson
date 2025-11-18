/**
 * 2.试验项目列表返回值
 */
export interface ProjectItemResponse {
  msg: string
  code: string
  data: ProjectItem[]
}

export interface ProjectItem {
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
   * 试验项目主键
   */
  projectId: number
  /**
   * 项目名称
   */
  projectName: string
  /**
   * 项目别称
   */
  projectAlias: string
  /**
   * 编码
   */
  code: string
  /**
   * 删除标识，0-未删除，1-已删除
   */
  delFlag: number
  dtProjectStandardList: object
  categoryId: object
  categoryCode: object
  standardString: object
}