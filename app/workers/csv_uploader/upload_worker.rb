# frozen_string_literal: true

module CsvUploader
  class UploadWorker
    include Sidekiq::Worker

    def perform(csv_file)
      CsvService::UploadCsv.new(csv_file).call
    end
  end
end
