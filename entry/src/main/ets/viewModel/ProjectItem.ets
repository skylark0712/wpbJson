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
  createBy: string
  createTime: string
  updateBy: string
  updateTime: string
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
  delFlag: number
  dtProjectStandardList: object
  categoryId: object
  categoryCode: object
  standardString: object
}