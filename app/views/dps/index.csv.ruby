require 'csv'

CSV.generate do |csv|
  column_names = %w(商品名 品番 JAN 取引先名 確認日 確認元 発生日 ロットNo. 返品有無 不良種類 内容 報告者)
  csv << column_names
  @dps.each do |dp|
    column_values = [
      dp.name,
      dp.product_number,
      dp.jan_code,
      dp.client,
      dp.confirm_date,
      dp.source_id,
      dp.occurrence_date,
      dp.lotnumber,
      dp.return_id,
      dp.category.name,
      dp.content,
      dp.user.name
    ]
    csv << column_values
  end
end