namespace :data do

  task import_worker_hours: :environment do
    book = Roo::Spreadsheet.open "/Users/yangdong/Downloads/科福/2018工人工时及借支情况\(2\).xls"
    cache_worker = {}
    cache_project = {}
    book.sheets.each do |sheet_name|
      sheet = book.sheet(sheet_name)
      sheet.each_with_index do |row, index|
        next if index == 0
        break unless row[0].to_s.present? && sheet_name.include?(row[0].to_s) && row[2].to_f > 0 && row[2].to_f < 5
        worker = cache_worker[row[0]]
        if worker.blank?
          worker = Worker.find_or_create_by(name: row[0])
          cache_worker[row[0]] = worker
        end
        project = cache_project[row[0]]
        if project.blank?
          project = Project.find_or_create_by(name: row[4])
          cache_project[row[4]] = project
        end
        begin
          worker.worker_hours.create(project_id: project.id, work_on: row[1].to_date, quantity: row[2].to_f, amount: row[5].to_f)
          worker.worker_advances.create(advance_on: row[1].to_date, amount: row[3].to_f) if row[3].to_f > 0
        rescue
        end
      end
    end
  end

end
