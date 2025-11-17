export interface CategoryItemResponse {
  msg: string
  code: string
  data: CategoryItem[]
}

export interface CategoryItem {
  // createTime: string
  categoryId: string
  categoryName: string

}